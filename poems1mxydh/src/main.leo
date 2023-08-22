// The 'poems1mxydh' program.
// I need to revise the program to always include me as the owner of the record, but the 
//adress used to generate the record's randomness should be something else I should include here. 

program poems1mxydh.aleo { 
    // This program is designed to test nonce checks for building random serial entropy's.
    // It aims to commit a field with a random scalar and then ziffie.

    // Define a record to store account-related information.
    record AccountQueryRecord {
        owner: address,             // Address of the owner.
        api_key: address,           // API key for the Game Developer's Account Query upon Invo Game Registration.
        node_id: address,           // Node ID.
        game_id: address,           // Game ID.
        pool_id: address,           // Pool ID.
        account_id: address,        // Account ID.
        asset_id: field,            // Asset ID.
        diffie_key1: scalar,        // First scalar value for cryptographic operations.
        diffie_key2: scalar,        // Second scalar value for cryptographic operations.
        z1: address,                // Address for storing the first POEMS zk-SNARKs related data.
        z2: address,                // Address for storing the second POEMS zk-SNARKs related data.
        z3: address,                // Address for storing the third POEMS zk-SNARKs related data.
        z4: address,                // Address for storing the fourth POEMS zk-SNARKs related data.
        z5: address,                // Address for storing the fifth POEMS zk-SNARKs related data.
    }
    
    // Function to generate a field using BHP hash and commit functions.
    function generate_field(x: field, y: scalar) -> field {
        // Hash the field and scalar values.
        let final: field = BHP1024::hash_to_field(x);
        let mixxy: scalar = BHP512::hash_to_scalar(y);
        // Commit the hashed values to produce the final field.
        let showdown: field = BHP256::commit_to_field(final, mixxy);

        return showdown;
    }

      // Function to generate an address using a combination of hashing and committing functions.
    function poems(x: field, y: scalar, z: group) -> address {
        let groupy: group = Poseidon2::hash_to_group(z);
        let final: field = BHP1024::hash_to_field(x);
        let mixxy: scalar = BHP512::hash_to_scalar(y);
        let showdown: field = BHP256::commit_to_field(final, mixxy);
        let countdown: scalar = BHP256::hash_to_scalar(groupy);
        let finalcountdown: address = BHP256::commit_to_address(showdown, countdown);

        return finalcountdown;
    }

   
    // Function to mix various inputs and produce a group.
    function mixer(ziffie: field, hellmen: field, diffie1: scalar, diffie2: scalar) -> group { 
        // Initial assignments.
        let accountQuery: field = ziffie;
        let bindID: field = hellmen;
        let uno: scalar = diffie1;
        let dos: scalar = diffie2;

        // 🌟🌟🌟🌟🌟🌟🌟Wumbo-mumbo-jumbo🌟🌟🌟🌟🌟🌟🌟🌟
        let abu: group = BHP256::hash_to_group(diffie1);
        let javed: group = BHP256::hash_to_group(diffie2);

        let invo: u64 = Poseidon4::hash_to_u64(abu);
        let tech: u64 = Poseidon4::hash_to_u64(javed);

        let wombo: u128 = Poseidon2::hash_to_u128(invo);
        let combo: u128 = Poseidon2::hash_to_u128(tech);
        let mumbo: group = BHP256::hash_to_group(wombo);
        let jumbo: scalar = BHP256::hash_to_scalar(combo);
        let wumbo: address = BHP256::commit_to_address(mumbo, jumbo);


        let inc: u128 = BHP256::hash_to_u128(wumbo);
        let wassif: scalar = Poseidon2::hash_to_scalar(inc);
        let adi: u128 = Poseidon2::hash_to_u128(accountQuery);
        let alex: u128 = Poseidon2::hash_to_u128(bindID); 
        let justin: group = BHP256::commit_to_group(adi, wassif);
        let ayesha: group = BHP256::commit_to_group(alex, wassif);

        let delroy: u64 = Poseidon2::hash_to_u64(ayesha);
        let brown: u64 = Poseidon2::hash_to_u64(justin);

        let snarky: u128 = Poseidon2::hash_to_u128(delroy);
        let narky: u128 = Poseidon2::hash_to_u128(brown);
        let arky: group = BHP256::hash_to_group(snarky);
        let rky: scalar = BHP256::hash_to_scalar(narky);
        let zecray: address = BHP256::commit_to_address(arky, rky);


        let dylan: field = BHP256::hash_to_field(zecray);
        let mixed: group = BHP256::commit_to_group(dylan, wassif);
        return mixed;
    }

    // Function to generate a zk-SNARKs related field.
    function generate_ziffie(x: field, y: scalar) -> field {
        let final: field = BHP1024::hash_to_field(x);
        let mixxy: scalar = BHP512::hash_to_scalar(y);
        let showdown: field = BHP256::commit_to_field(final, mixxy);

        return showdown;
    }

   // Function to generate a scalar using BHP hash.
    function generate_scalar(y: scalar) -> scalar {
        let mixxy: scalar = BHP256::hash_to_scalar(y);
        let dixxy: scalar = Poseidon2::hash_to_scalar(mixxy); // Used as diffie, and then committed later.

        return dixxy;
    }

    // Function to generate an address based on a given field.
    function tableset_record(query: field) -> address {
        let query_record: u64 = BHP512::hash_to_u64(query);
        let query_group: group = Pedersen128::hash_to_group(query_record);
        let query_scalar: scalar = Pedersen128::hash_to_scalar(query_record);
        let table_record: address = BHP256::hash_to_address(query_group);
        let commit_tableset_record: address = BHP256::commit_to_address(table_record,query_scalar);

        return commit_tableset_record;
    }

    // Transition function to play the game and return an AccountQueryRecord.
    // The goal is to reduce the constraints as much as possible, while also ensuring the hashes are mixed thoroughly.
    transition interpretations(long_string: field, long_int: field, short_field: field, ziffie_scalar: scalar) 
    -> AccountQueryRecord {
        // 🌟 Generate scalar values for cryptographic operations.
        let invo: address = aleo1mxydh902u86qzdkl24khmxf6cm50fms4je25umvr5xwmq4rsn59su3k8a6; // change for personal use.
        let diffie1: scalar = generate_scalar(ziffie_scalar);
        let diffie2: scalar = generate_scalar(diffie1.add(ziffie_scalar)); // this is a Scalar Mixer

         // 🌟 Generate fields and addresses using the provided inputs and scalar values.
        // The following steps involve a series of hashing, committing, and mixing operations to produce the final record.

        
        
        let new_node_id: field = generate_field(long_string, diffie1);
            let node: address = tableset_record(new_node_id);
                let zkdid1: field = generate_ziffie(new_node_id, diffie2); // this is to purchase
                let zk1: group = mixer(new_node_id, zkdid1, diffie1, diffie2);
        let ziffiehellman1: address =  poems(zkdid1, diffie2, zk1);

        let new_game_id: field = generate_field(short_field, diffie1);
            let game: address = tableset_record(new_game_id);
                let zkdid2: field = generate_ziffie(new_game_id, diffie2); // this is to purchase recover
                let zk2: group = mixer(new_game_id, zkdid2, diffie1, diffie2);
        let ziffiehellman2: address =  poems(zkdid2, diffie2, zk2);

        let new_pool_id: field = generate_field(long_int * short_field, diffie2);
            let pool: address = tableset_record(new_pool_id);
                let zkdid3: field = generate_ziffie(new_pool_id, diffie1); // this is to spend
                let zk3: group = mixer(new_pool_id, zkdid3, diffie2, diffie1);
        let ziffiehellman3: address =  poems(zkdid3, diffie2, zk3);

        let new_account_id: field = generate_field(long_string * short_field + zkdid3, diffie1);
            let vendor: address = tableset_record(new_account_id);
                let zkdid4: field = generate_ziffie(new_account_id, diffie2); // this is to transfer
                let zk4: group = mixer(new_account_id, zkdid4, diffie2, diffie1);
        let ziffiehellman4: address = poems(zkdid4, diffie1, zk4);

        let new_asset_id: field = generate_field(long_string * long_int, diffie2);
                let zkdid5: field = generate_ziffie(new_asset_id, diffie1); // this is to send
                let zk5: group = mixer(new_asset_id, zkdid5, diffie2, diffie1);
        let ziffiehellman5: address = poems(zkdid5, diffie1, zk5);

        let new_api_key: field = generate_field(new_node_id + new_game_id + new_pool_id + new_account_id + new_asset_id + zkdid5 + zkdid4 + zkdid3 + zkdid4 + zkdid5, diffie1 + diffie2);
                let devkey: field = generate_ziffie(new_api_key, diffie2);
                let invokey: group = mixer (new_api_key, devkey, diffie2, diffie1);
        let apikey: address = poems(devkey, diffie1, invokey);

        // Create an instance of the AccountQueryRecord with the generated values.
        let new_record: AccountQueryRecord = AccountQueryRecord {
            owner: invo, 
            api_key: apikey,
            node_id: node,
            game_id: game,
            pool_id: pool,
            account_id: vendor,
            asset_id: new_asset_id,
            diffie_key1: diffie1, 
            diffie_key2: diffie2, 
            z1: ziffiehellman1,
            z2: ziffiehellman2,
            z3: ziffiehellman3,
            z4: ziffiehellman4,
            z5: ziffiehellman5
        };

        return new_record; 
    } // 383,154 constraints
}
