module MyModule::P2PCarRental{

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use std::vector;

    struct Project has store, key{
        owner: address,
        desc: vector<u8>,
        reward: u64,
    }


    // function to list a car

    public fun list_project(owner: &signer, desc: vector<u8>){
        let project = Project{
            owner: signer::address_of(owner),
            desc,
            reward: 0,
        };
        move_to(owner,project);
    }


    public fun fund_project(funder: &signer, receiver: &signer, owner_address:address, amount:u64) acquires Project{
        let project = borrow_global_mut<Project>(owner_address);
        let u1=signer::address(&funder);
        let u2=signer::address(&receiver);
        let tf=amount;
        tranfer_apt(&u1,u2,tf);
        project.reward = project.reward + 1;
    }
}