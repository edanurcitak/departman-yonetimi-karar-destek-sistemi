const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database:'kds-2023',

});

connection.connect((err) => {
    if (err) {
        console.error('Veritabanına bağlanırken bir hata oluştu: ' + err.stack);
        return;
    }
    console.log('Veritabanına başarıyla bağlanıldı!');
});

module.exports = connection;