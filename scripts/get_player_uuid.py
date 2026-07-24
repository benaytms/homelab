import hashlib, uuid
def offline_uuid(username):
    data = ('OfflinePlayer:' + username).encode('utf-8')
    b = bytearray(hashlib.md5(data).digest())
    b[6] = (b[6] & 0x0f) | 0x30
    b[8] = (b[8] & 0x3f) | 0x80
    return str(uuid.UUID(bytes=bytes(b)))

user_name = str(input("Nick do usuario: "))
print("uuid:", offline_uuid(user_name))
