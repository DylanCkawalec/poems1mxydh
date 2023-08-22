program poems1mxydh.aleo;

record AccountQueryRecord:
    owner as address.private;
    api_key as address.private;
    node_id as address.private;
    game_id as address.private;
    pool_id as address.private;
    account_id as address.private;
    asset_id as field.private;
    diffie_key1 as scalar.private;
    diffie_key2 as scalar.private;
    z1 as address.private;
    z2 as address.private;
    z3 as address.private;
    z4 as address.private;
    z5 as address.private;


closure generate_field:
    input r0 as field;
    input r1 as scalar;
    hash.bhp1024 r0 into r2 as field;    hash.bhp512 r1 into r3 as scalar;    commit.bhp256 r2 r3 into r4 as field;    output r4 as field;


closure poems:
    input r0 as field;
    input r1 as scalar;
    input r2 as group;
    hash.psd2 r2 into r3 as group;    hash.bhp1024 r0 into r4 as field;    hash.bhp512 r1 into r5 as scalar;    commit.bhp256 r4 r5 into r6 as field;    hash.bhp256 r3 into r7 as scalar;    commit.bhp256 r6 r7 into r8 as address;    output r8 as address;


closure mixer:
    input r0 as field;
    input r1 as field;
    input r2 as scalar;
    input r3 as scalar;
    hash.bhp256 r2 into r4 as group;    hash.bhp256 r3 into r5 as group;    hash.psd4 r4 into r6 as u64;    hash.psd4 r5 into r7 as u64;    hash.psd2 r6 into r8 as u128;    hash.psd2 r7 into r9 as u128;    hash.bhp256 r8 into r10 as group;    hash.bhp256 r9 into r11 as scalar;    commit.bhp256 r10 r11 into r12 as address;    hash.bhp256 r12 into r13 as u128;    hash.psd2 r13 into r14 as scalar;    hash.psd2 r0 into r15 as u128;    hash.psd2 r1 into r16 as u128;    commit.bhp256 r15 r14 into r17 as group;    commit.bhp256 r16 r14 into r18 as group;    hash.psd2 r18 into r19 as u64;    hash.psd2 r17 into r20 as u64;    hash.psd2 r19 into r21 as u128;    hash.psd2 r20 into r22 as u128;    hash.bhp256 r21 into r23 as group;    hash.bhp256 r22 into r24 as scalar;    commit.bhp256 r23 r24 into r25 as address;    hash.bhp256 r25 into r26 as field;    commit.bhp256 r26 r14 into r27 as group;    output r27 as group;


closure generate_ziffie:
    input r0 as field;
    input r1 as scalar;
    hash.bhp1024 r0 into r2 as field;    hash.bhp512 r1 into r3 as scalar;    commit.bhp256 r2 r3 into r4 as field;    output r4 as field;


closure generate_scalar:
    input r0 as scalar;
    hash.bhp256 r0 into r1 as scalar;    hash.psd2 r1 into r2 as scalar;    output r2 as scalar;


closure tableset_record:
    input r0 as field;
    hash.bhp512 r0 into r1 as u64;    hash.ped128 r1 into r2 as group;    hash.ped128 r1 into r3 as scalar;    hash.bhp256 r2 into r4 as address;    commit.bhp256 r4 r3 into r5 as address;    output r5 as address;


function interpretations:
    input r0 as field.private;
    input r1 as field.private;
    input r2 as field.private;
    input r3 as scalar.private;
    call generate_scalar r3 into r4;
    add r4 r3 into r5;
    call generate_scalar r5 into r6;
    call generate_field r0 r4 into r7;
    call tableset_record r7 into r8;
    call generate_ziffie r7 r6 into r9;
    call mixer r7 r9 r4 r6 into r10;
    call poems r9 r6 r10 into r11;
    call generate_field r2 r4 into r12;
    call tableset_record r12 into r13;
    call generate_ziffie r12 r6 into r14;
    call mixer r12 r14 r4 r6 into r15;
    call poems r14 r6 r15 into r16;
    mul r1 r2 into r17;
    call generate_field r17 r6 into r18;
    call tableset_record r18 into r19;
    call generate_ziffie r18 r4 into r20;
    call mixer r18 r20 r6 r4 into r21;
    call poems r20 r6 r21 into r22;
    mul r0 r2 into r23;
    add r23 r20 into r24;
    call generate_field r24 r4 into r25;
    call tableset_record r25 into r26;
    call generate_ziffie r25 r6 into r27;
    call mixer r25 r27 r6 r4 into r28;
    call poems r27 r4 r28 into r29;
    mul r0 r1 into r30;
    call generate_field r30 r6 into r31;
    call generate_ziffie r31 r4 into r32;
    call mixer r31 r32 r6 r4 into r33;
    call poems r32 r4 r33 into r34;
    add r7 r12 into r35;
    add r35 r18 into r36;
    add r36 r25 into r37;
    add r37 r31 into r38;
    add r38 r32 into r39;
    add r39 r27 into r40;
    add r40 r20 into r41;
    add r41 r27 into r42;
    add r42 r32 into r43;
    add r4 r6 into r44;
    call generate_field r43 r44 into r45;
    call generate_ziffie r45 r6 into r46;
    call mixer r45 r46 r6 r4 into r47;
    call poems r46 r4 r47 into r48;
    cast aleo1mxydh902u86qzdkl24khmxf6cm50fms4je25umvr5xwmq4rsn59su3k8a6 r48 r8 r13 r19 r26 r31 r4 r6 r11 r16 r22 r29 r34 into r49 as AccountQueryRecord.record;
    output r49 as AccountQueryRecord.record;
