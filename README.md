# Postgres
![image](https://raw.githubusercontent.com/THD-C/DB_Manager/main/ERD.png)

![image](https://raw.githubusercontent.com/THD-C/.github/main/Pictures/database.png)

# SQL Database
## Tabele
1. Użytkownicy:
    - username
    - password
    - dane osobowe
    - user_id
2. Transakcje:
    - data
    - rodzaj operacji (wpłata/wypłata)
    - waluta
    - kwota
    - user_id
3. Transakcje giełdowe:
    - data (jeżeli transakcja zrealizowana to ma datę, jeśli czeka to data jest NULL)
    - kryptowaluta
    - kwota
    - kurs 
    - user_id
    - rodzaj operacji (instant, stop loss, take profit)
4. Wallet ( wynika z tab. nr 3)
    - ilosc_crypto
    - crypto_id
    - user_id
5. Rachunki/Salda fiat ( wynika z tab. nr 2)
    - ilosc_pieniedzy
    - waluta_id
    - user_id
6. Zlecenia
