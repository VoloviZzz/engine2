module.exports = {
    db: {
        host: 'localhost',
        user: 'root',
        password: 'qwer1234',
        database: 'test_routes'
    },
    web: {
        port: 3000
    },
    session: {
        name: 'es_public',
        keys: ['98908e06919db0f294eczcjfafb711c3'],
        maxAge: 24 * 60 * 60 * 1000,
        secure: false
    }
}