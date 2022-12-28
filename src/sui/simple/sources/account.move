module simple::account {
    use sui::transfer;
    use std::string::{Self, String};
    use sui::object::UID;
    use sui::tx_context::{Self, TxContext};

    struct Account has key, store {
        id: UID,
        name: String,
        amount: u64,
    }

    entry public fun open(name_bytes: vector<u8>, amount: u64, ctx: &mut TxContext) {
        let account = Account {
            id: sui::object::new(ctx),
            name: string::utf8(name_bytes),
            amount: amount,
        };

        transfer::transfer(account, tx_context::sender(ctx));
    }

    entry public fun transfer(acc_from: &mut Account, acc_to: &mut Account, amount: u64) {
        acc_from.amount = acc_from.amount - amount;
        acc_to.amount = acc_to.amount + amount;
    }
}
