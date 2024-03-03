# Runs an anvil blockchain as well as a Flask application

import subprocess
from eth_account.hdaccount import generate_mnemonic
from eth_account import Account
from flask import Flask, Response, request, abort, render_template
import requests
from web3 import Web3
from time import sleep
from re import findall

FLAG = 'GCC{Fr0nT_@nd_BACK_Runn!ng_Ar3_KING$_in_W3b3}'
RPC_URL = 'http://127.0.0.1:8545'
FORK_URL = 'https://eth.drpc.org'
FORK_BLOCK = '19301562'
PLAYER_ADDRESS = '0xCaffE305b3Cc9A39028393D3F338f2a70966Cb85'
PLAYER_KEY = '0x6715d324d14e0565ab02a575fa5f74540719ba065a610cba6497cdbf22cd5cdb'

Account.enable_unaudited_hdwallet_features()

mnemonic = generate_mnemonic(12, 'english')

deployer_account = Account.from_mnemonic(mnemonic, account_path=f"m/44'/60'/0'/0/0")
deployer_key = deployer_account._private_key.hex()
deployer_address = deployer_account.address

contracts = {}

proc = subprocess.Popen(
    args=[
        '/home/user/.foundry/bin/anvil',
        '--accounts',
        '1',
        '--balance',
        '10000',
        '--fork-url',
        FORK_URL,
        '--mnemonic',
        mnemonic,
        '--fork-block-number',
        FORK_BLOCK,
        '--block-time',
        '4'
    ],
)

web3 = Web3(Web3.HTTPProvider(RPC_URL))
while True:
    if proc.poll() is not None:
        exit(1)
    if web3.is_connected() and web3.eth.get_block('latest')['number'] > int(FORK_BLOCK) + 1:
        break
    sleep(0.1)

# Deploys the challenge
deployer = subprocess.run([
    '/home/user/.foundry/bin/forge',
    'script', 
    './script/Deploy.s.sol',
    '--broadcast',
    '--slow',
    '--rpc-url',
    RPC_URL,
    '--private-key',
    deployer_key], stdout=subprocess.PIPE, cwd='/home/user/blockchain')

result = deployer.stdout.decode()

open("/tmp/deployment.out", "a").write(result)

contracts['Challenge'] = findall('Challenge deployed at : (.*)',result)[0]

# Sets the challenge address in the Minaminao script
replace_chall_address = subprocess.Popen(
    args=[
        'sed',
        '-i', 
        f's/address(1)/{contracts["Challenge"]}/g',
        '/home/user/blockchain/script/Minaminao.s.sol'
    ],
)

app = Flask(__name__)

ALLOWED_NAMESPACES = ['web3', 'eth', 'net']

@app.route('/')
def index():
    return render_template('index.html', key=PLAYER_KEY, address=PLAYER_ADDRESS, challenge=contracts['Challenge'])

# proxies requests to the blockchain after parsing it
@app.route('/rpc', methods=['POST'])
def rpc():
    body = request.get_json()

    allowed = (
        any(body['method'].startswith(namespace)
            for namespace in ALLOWED_NAMESPACES)
        and body['method'] != 'eth_sendUnsignedTransaction'
    )

    if allowed:
        resp = requests.post(RPC_URL, json=body)
        response = Response(resp.content, resp.status_code,
                            resp.raw.headers.items())
        return response

    abort(403)

@app.route('/flag')
def flag():
    solve_proc = subprocess.run([
        '/home/user/.foundry/bin/cast',
        'call',
        contracts['Challenge'],
        'isSolved()(bool)',
        '--rpc-url',
        RPC_URL
    ], stdout=subprocess.PIPE)
    is_solved = solve_proc.stdout.decode().strip()

    if is_solved == 'true':
        return FLAG
    else:
        return 'Try again...'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='8000')
