import ldap

# Connection
con = ldap.initialize('ldap://openldap.default.svc.cluster.local')
con.simple_bind_s("cn=admin,dc=local,dc=io", "admin")

# Properties
uid = ["user1", "user2", "user3", "user4", "user2"]
line = []
attribute = 'mail'
ldap_base = "dc=local,dc=io"
line = []

# Mail Address Search and make mail list
for i in range(len(uid)):
    query = "(uid="+uid[i]+")"
    r = con.search_s(ldap_base,ldap.SCOPE_SUBTREE, query,[attribute])
    try:
        mail_addr = r[0][1][attribute][0]
        line.append(mail_addr)
    except KeyError:
        print(f'uid: {uid[i]}, mail_addr is unkown')
        
# Dup remove
print (list(set(line)))
