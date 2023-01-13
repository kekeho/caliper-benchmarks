module simple::account {
    use sui::transfer;
    use std::string::{Self, String};
    use sui::object::UID;
    use sui::tx_context::{Self, TxContext};
    use sui::table::{Self, Table};

    struct Account has key, store {
        id: UID,
        name: String,
        amount: u64,
    }

    struct Accounts has key, store {
        id: UID,
        accounts: Table<String, Account>,
    }

    fun init(ctx: &mut TxContext) {
        let accounts = Accounts {
            id: sui::object::new(ctx),
            accounts: table::new(ctx),
        };

        transfer::transfer(accounts, tx_context::sender(ctx));
    }

    entry public fun open(accounts: &mut Accounts, name_bytes: vector<u8>, amount: u64, ctx: &mut TxContext) {
        let name = string::utf8(name_bytes);
        let account = Account {
            id: sui::object::new(ctx),
            name: name,
            amount: amount,
        };

        table::add(&mut accounts.accounts, name, account);
    }

    entry public fun transfer(accounts: &mut Accounts, from: vector<u8>, to: vector<u8>, amount: u64) {
        let fromS = string::utf8(from);
        let toS = string::utf8(to);

        let fromAccount = table::borrow_mut(&mut accounts.accounts, fromS);
        fromAccount.amount = fromAccount.amount - amount;

        let toAccount = table::borrow_mut(&mut accounts.accounts, toS);
        toAccount.amount = toAccount.amount + amount;
    }
}
