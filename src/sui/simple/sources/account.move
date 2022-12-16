module simple::account {
    use sui::transfer;
    use sui::object::UID;
    use sui::tx_context::{Self, TxContext};

    struct Account has key, store {
        id: UID,
        amount: u128,
    }

    public fun open(ctx: &mut TxContext, amount: u128) {
        let account = Account {
            id: sui::object::new(ctx),
            amount: amount,
        };

        transfer::transfer(account, tx_context::sender(ctx));
    }

    public fun query(acc: &mut Account): u128 {
        return acc.amount
    }

    public fun transfer(acc_from: &mut Account, acc_to: &mut Account, amount: u128) {
        acc_from.amount = acc_from.amount - amount;
        acc_to.amount = acc_to.amount + amount;
    }
}
