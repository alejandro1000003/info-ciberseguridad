1. Solicitud http (uso básico)
```sh
curl http://10.10.28.78/cookie-test
```
2. Solicitud con cookies cómo parámetros
```sh
curl -H "Cookie: logged_in=true; admin=false" http://10.10.28.78/cookie-test
```

## **Hashing**
tipos de hash que se pueden aplicar a las cookies (puedes intentar crackearlas desde aquí; https://crackstation.net/)

| **Original String** | **Hash Method** | **Output**                                                                                                                       |
| ------------------- | --------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| 1                   | md5             | c4ca4238a0b923820dcc509a6f75849b                                                                                                 |
| 1                   | sha-256         | 6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b                                                                 |
| 1                   | sha-512         | 4dff4ea340f0a823f15d3f4f01ab62eae0e5da579ccb851f8db9dfe84c58b2b37b89903a740e1ee172da793a6e79d560e5f7f9bd058a12a280433ed6fa46510a |
| 1                   | sha1            | 356a192b7913b04c54574d18c28d46e6395428ab                                                                                         |

