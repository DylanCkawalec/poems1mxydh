![poems-mixxer](https://github.com/Invo-Technologies/poemsdemo1nqvlm/assets/43707795/ccf7945a-98e9-4b45-ae98-4957f9d466a9)

# Poems Encrypt Secret Records 

This project is designed to test record generation on the Aleo platform.

## Setting Up

### Testing Record Generation

To test record generation, use the following command:

```bash
$ Aleo account new
```

You should receive output similar to:

```plaintext
Private Key: APrivateKey...
View Key: AViewKey...
Address: aleo1...
```

### Environment Variables

Before running the subsequent commands, set up the necessary environment variables:

```bash
export PRIVATEKEY="YourPrivateKeyHere"
export VIEWKEY="YourViewKeyHere"
export WALLETADDRESS="YourWalletAddressHere"
export APPNAME=poems${WALLETADDRESS:4:6}
export RECORD="YourRecordHere"
```

## Development Workflow

### 1. Initialize the Application

To start a new application:

```bash
leo new $APPNAME
cd $APPNAME
```

### 2. Building the Application

To build the application:

```bash
leo build
```

### 3. Deploy the Application

To deploy the application:

```bash
snarkos developer deploy "${APPNAME}.aleo" \
--private-key "${PRIVATEKEY}" \
... # other flags
```

### 4. Execute the Application

To execute the application:

```bash
snarkos developer execute "${APPNAME}.aleo" "interpretations" \
... # other flags
```

## `poems1mxydh.aleo` Program Documentation

### Overview

The `poems1mxydh.aleo` program is written in the Leo programming language, tailored for creating zero-knowledge proofs (ZKPs) on the Aleo platform. This program focuses on generating various cryptographic values, such as fields, scalars, groups, and addresses, using different hashing and committing functions.

### Table of Contents

- [Record Definition](#record-definition)
- [Functions](#functions)
  - [generate_field](#generate_field)
  - [poems](#poems)
  - [mixer](#mixer)
  - [generate_ziffie](#generate_ziffie)
  - [generate_scalar](#generate_scalar)
  - [tableset_record](#tableset_record)
  - [interpretations](#interpretations)
- [Variable Relations](#variable-relations)
- [Conclusion](#conclusion)

### Record Definition

The program defines a record named `AccountQueryRecord` to store various account-related information. This record encapsulates:

- Owner's address
- API key representing the game developer's account query
- Multiple addresses and fields related to game and account details
- Scalar values (`diffie_key1` and `diffie_key2`) for cryptographic operations
- Addresses (`z1` to `z5`) for storing zk-SNARKs related data

### Functions

#### `generate_field`

This function takes in a field and a scalar as arguments and returns a field. It uses various hashing functions, such as `BHP1024::hash_to_field` and `BHP512::hash_to_scalar`, to generate the final field value.

#### `poems`

The `poems` function takes in a field, scalar, and group as arguments and returns an address. It combines multiple hashing and committing functions to produce the final address.

#### `mixer`

The `mixer` function is designed to mix various inputs and produce a group. It takes in two fields and two scalars as arguments. The function uses a series of hashing and committing functions to generate the final group.

#### `generate_ziffie`

This function is tailored to generate a zk-SNARKs related field. It takes in a field and a scalar as arguments and returns a field after processing them through hashing and committing functions.

#### `generate_scalar`

Designed to produce a scalar, this function takes in a scalar and processes it through hashing functions to return the final scalar.

#### `tableset_record`

This function takes in a field and returns an address. It hashes the input field to produce a u64 value, which is then hashed to produce a group and a scalar. These values are then used to generate the final address.

#### `interpretations`

The primary function of the program, `interpretations`, takes in a long string, long integer, short field, owner address, and a scalar. It returns an `AccountQueryRecord`. This function combines the functionalities of all the above functions to produce the final record.

### Variable Relations

The program uses a series of variables, each dependent on the previous ones, to generate the final `AccountQueryRecord`. Here's a brief overview of the relations:

- `diffie1` and `diffie2` are generated scalars used in subsequent functions.
- `new_node_id`, `new_game_id`, `new_pool_id`, `new_account_id`, and `new_asset_id` are fields generated using the `generate_field` function.
- `zkdid1` to `zkdid5` are zk-SNARKs related fields generated using the `generate_ziffie` function.
- `ziffiehellmen1` to `ziffiehellmen5` are addresses generated using the `poems` function.
- `node`, `game`, `pool`, and `vendor` are addresses generated using the `tableset_record` function.
- `apikey` is an address generated using the `generate_field` function and represents the game developer's account query.

### Conclusion

The `poems1mxydh.aleo` program is a comprehensive representation of how cryptographic values can be generated and combined to produce a final record on the Aleo platform. The program uses a series of hashing and committing functions to ensure the security and integrity of the generated values. This program serves as a foundational piece for integrating the Aleo platform with other systems and showcases the potential of zk-SNARKs in modern cryptographic applications.

---

This documentation provides a high-level overview of the `poems1mxydh.aleo` program. Developers and users can refer to this README to understand the program's structure, functions, and variable relations.

## Notes

- After deploying the application, ensure you get the transaction ID. Use the appropriate snarkos operation to retrieve the record cipher associated with the transaction ID.
- Always update the `$RECORD` in your development directory after each deployment. The latest record must be spent for subsequent executions.

---
