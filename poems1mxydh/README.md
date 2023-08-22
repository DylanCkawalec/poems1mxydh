
---

## Aleo Deployment and Execution Guide

### 1. Account Creation

Start by creating a new Aleo account using the command:

```bash
aleo account new
```

Upon successful execution, you'll receive account keys similar to:

```
Private Key: APrivateKey1zkp43fYYjtBm6jaQjnUk9s7fXL6pQJrBZVShp7SmiTqTLWx
View Key: AViewKey1fVbpbZx6wWodaX7TuMTibhbsAhsndApxXHdAAdt8gY8h
Address: aleo1mxydh902u86qzdkl24khmxf6cm50fms4je25umvr5xwmq4rsn59su3k8a6
```

### 2. Environment Setup

Set up your environment variables in the development directory:

```bash
export PRIVATEKEY="APrivateKey1zkp43fYYjtBm6jaQjnUk9s7fXL6pQJrBZVShp7SmiTqTLWx"
export VIEWKEY="AViewKey1fVbpbZx6wWodaX7TuMTibhbsAhsndApxXHdAAdt8gY8h"
export WALLETADDRESS="aleo1mxydh902u86qzdkl24khmxf6cm50fms4je25umvr5xwmq4rsn59su3k8a6"
export APPNAME=poems${WALLETADDRESS:4:6}
export RECORD="{
  owner: aleo1mxydh902u86qzdkl24khmxf6cm50fms4je25umvr5xwmq4rsn59su3k8a6.private,
  microcredits: 50000000u64.private,
  _nonce: 471162405614527436891558549634226920061808711634138809028508136112047683621group.public
}"
```

### 3. Deployment

Navigate to the main directory (not the project directory) and run:

```bash
snarkos developer deploy "${APPNAME}.aleo" \
--private-key "${PRIVATEKEY}" \
--query "https://vm.aleo.org/api" \
--path "./${APPNAME}/build/" \
--broadcast "https://vm.aleo.org/api/testnet3/transaction/broadcast" \
--fee 1000000 \
--record "${RECORD}"
```

Upon successful deployment, you should see a message similar to:

```
✅ Successfully broadcast deployment at15mccefr2hllaw52yf0ycqzvgl09usrqe9kwpqsayqgelkave9u8q4sev2d ('poems1mxydh.aleo') to https://vm.aleo.org/api/testnet3/transaction/broadcast.
```

### 4. Record Retrieval

To retrieve the execution record, visit the Aleo explorer and obtain the record. An example of a decrypted record is:

```
{
  owner: aleo1mxydh902u86qzdkl24khmxf6cm50fms4je25umvr5xwmq4rsn59su3k8a6.private,
  microcredits: 45405000u64.private,
  _nonce: 3016279159222953658242422327971184427981562209849031368685727724873336431641group.public
}
```

### 5. Update Record

Replace `$RECORD` in your project directory with the new decrypted cipher.

### 6. Execution

Run the following command in the parent directory of your project:

```bash
snarkos developer execute "${APPNAME}.aleo" "interpretations" \
"8520650749374769618828460129257108676693581694449188701052862441field" \
"5783641603651458508888202454415830953800237504213249355999959221field" \
"6278531093974030460210037336448891209366432920917309734616724625field" \
"aleo1yskhw2d4puhz9ap0p0r3nl2swrdef8yw78lvxu0nt0drp0p8lczs8lglmf" \
"9939989133076672317247352179831314680005248935362109398146459836scalar" \
--private-key "${PRIVATEKEY}" \
--query "https://vm.aleo.org/api" \
--broadcast "https://vm.aleo.org/api/testnet3/transaction/broadcast" \
--fee 1000000 \
--record "${RECORD}"
```

### 7. Automatic Execution

To let the program automatically execute, run the Aleo SDK command directly on the program you deploy. Ensure the name of the program is set correctly based on `$APPNAME`. Verify your environment variables using commands like `echo $APPNAME` and `echo "$PRIVATEKEY"`.

### 8. Deployment without Record

You can also try deploying without attaching the record:

```bash
aleo execute "${APPNAME}.aleo" "interpretations" \
"9929891696506327032448749128388541166822167641109231004257954194field" \
"2397928415360758982251495695158766690193212409703036529613035698field" \
"5109035431855087456828935744535583296650156725180246782652504444field" \
"aleo1mxydh902u86qzdkl24khmxf6cm50fms4je25umvr5xwmq4rsn59su3k8a6" \
"2063927290885787559933916677033504451880884747625978317215764983scalar" \
--private-key "${PRIVATEKEY}" \
--fee 1
```

