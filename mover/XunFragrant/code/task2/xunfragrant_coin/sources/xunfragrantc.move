module xunfragrant_coin::xunfragrantc {
    use std::option;
    use sui::coin::{Self,Coin,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};


    public struct XUNFRAGRANTC has drop {}

    fun init(witness: XUNFRAGRANTC,ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(witness,6,b"XUNFRAGRANTC",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public fun mint(
    treasury_cap: &mut TreasuryCap<XUNFRAGRANTC>, 
    amount: u64, 
    recipient: address, 
    ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

}