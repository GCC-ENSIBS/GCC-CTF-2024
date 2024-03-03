

class Api:

    def __init__(self):
        self.user_level = {
            "anonymous": 0,
            "user": 1,
            "admin": 2
        }

    def get_user_level(self, user: str):
        if user in self.user_level.keys():
            return self.user_level[user]
        else:
            return self.user_level["anonymous"]
    
    def is_valid_token(self, token: str):
        if token == "anonymous":
            return True
        else:
            return False
