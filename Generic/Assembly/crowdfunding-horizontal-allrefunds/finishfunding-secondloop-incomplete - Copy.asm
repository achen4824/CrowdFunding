     PUSH 0			0
      DUP4 			finalValue
      EQ 			finalValue == 0
      ISZERO 			if(finalValue == 0){\r\n      ...
      PUSH [tag] 54			if(finalValue == 0){\r\n      ...
      JUMPI 			if(finalValue == 0){\r\n      ...
      PUSH 0			uint a
      DUP1 			0
      SWAP1 			uint a = 0
      POP 			uint a = 0
    tag 55			for(uint a = 0; a<allFunders.l...
      JUMPDEST 			for(uint a = 0; a<allFunders.l...
      PUSH 5			allFunders
      DUP1 			allFunders.length
      SLOAD 			allFunders.length
      SWAP1 			allFunders.length
      POP 			allFunders.length
      DUP2 			a
      LT 			a<allFunders.length
      ISZERO 			for(uint a = 0; a<allFunders.l...
      PUSH [tag] 56			for(uint a = 0; a<allFunders.l...
      JUMPI 			for(uint a = 0; a<allFunders.l...
      PUSH 5			allFunders
      DUP2 			a
      DUP2 			allFunders[a]
      SLOAD 			allFunders[a]
      DUP2 			allFunders[a]
      LT 			allFunders[a]
      PUSH [tag] 58			allFunders[a]
      JUMPI 			allFunders[a]
      INVALID 			allFunders[a]
    tag 58			allFunders[a]
      JUMPDEST 			allFunders[a]
      SWAP1 			allFunders[a]
      PUSH 0			allFunders[a]
      MSTORE 			allFunders[a]
      PUSH 20			allFunders[a]
      PUSH 0			allFunders[a]
      KECCAK256 			allFunders[a]
      ADD 			allFunders[a]
      PUSH 0			allFunders[a]
      SWAP1 			allFunders[a]
      SLOAD 			allFunders[a]
      SWAP1 			allFunders[a]
      PUSH 100			allFunders[a]
      EXP 			allFunders[a]
      SWAP1 			allFunders[a]
      DIV 			allFunders[a]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			allFunders[a]
      AND 			allFunders[a]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			allFunders[a].transfer
      AND 			allFunders[a].transfer
      PUSH 8FC			allFunders[a].transfer(address...
      PUSH 6			addressToValue
      PUSH 0			addressToValue[allFunders[a]]
      PUSH 5			allFunders
      DUP6 			a
      DUP2 			allFunders[a]
      SLOAD 			allFunders[a]
      DUP2 			allFunders[a]
      LT 			allFunders[a]
      PUSH [tag] 60			allFunders[a]
      JUMPI 			allFunders[a]
      INVALID 			allFunders[a]
    tag 60			allFunders[a]
      JUMPDEST 			allFunders[a]
      SWAP1 			allFunders[a]
      PUSH 0			allFunders[a]
      MSTORE 			allFunders[a]
      PUSH 20			allFunders[a]
      PUSH 0			allFunders[a]
      KECCAK256 			allFunders[a]
      ADD 			allFunders[a]
      PUSH 0			allFunders[a]
      SWAP1 			allFunders[a]
      SLOAD 			allFunders[a]
      SWAP1 			allFunders[a]
      PUSH 100			allFunders[a]
      EXP 			allFunders[a]
      SWAP1 			allFunders[a]
      DIV 			allFunders[a]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			allFunders[a]
      AND 			allFunders[a]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			addressToValue[allFunders[a]]
      AND 			addressToValue[allFunders[a]]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			addressToValue[allFunders[a]]
      AND 			addressToValue[allFunders[a]]
      DUP2 			addressToValue[allFunders[a]]
      MSTORE 			addressToValue[allFunders[a]]
      PUSH 20			addressToValue[allFunders[a]]
      ADD 			addressToValue[allFunders[a]]
      SWAP1 			addressToValue[allFunders[a]]
      DUP2 			addressToValue[allFunders[a]]
      MSTORE 			addressToValue[allFunders[a]]
      PUSH 20			addressToValue[allFunders[a]]
      ADD 			addressToValue[allFunders[a]]
      PUSH 0			addressToValue[allFunders[a]]
      KECCAK256 			addressToValue[allFunders[a]]
      PUSH 0			addressToValue[allFunders[a]]....
      ADD 			addressToValue[allFunders[a]]....
      SLOAD 			addressToValue[allFunders[a]]....
      SWAP1 			allFunders[a].transfer(address...
      DUP2 			allFunders[a].transfer(address...
      ISZERO 			allFunders[a].transfer(address...
      MUL 			allFunders[a].transfer(address...
      SWAP1 			allFunders[a].transfer(address...
      PUSH 40			allFunders[a].transfer(address...
      MLOAD 			allFunders[a].transfer(address...
      PUSH 0			allFunders[a].transfer(address...
      PUSH 40			allFunders[a].transfer(address...
      MLOAD 			allFunders[a].transfer(address...
      DUP1 			allFunders[a].transfer(address...
      DUP4 			allFunders[a].transfer(address...
      SUB 			allFunders[a].transfer(address...
      DUP2 			allFunders[a].transfer(address...
      DUP6 			allFunders[a].transfer(address...
      DUP9 			allFunders[a].transfer(address...
      DUP9 			allFunders[a].transfer(address...
      CALL 			allFunders[a].transfer(address...
      SWAP4 			allFunders[a].transfer(address...
      POP 			allFunders[a].transfer(address...
      POP 			allFunders[a].transfer(address...
      POP 			allFunders[a].transfer(address...
      POP 			allFunders[a].transfer(address...
      ISZERO 			allFunders[a].transfer(address...
      DUP1 			olidity >
      ISZERO 			a 
      PUSH [tag] 62			a 
      JUMPI 			a 
      RETURNDATASIZE 			crowdfunding{\r\n 
      PUSH 0			c
      DUP1 			t
      RETURNDATACOPY 			 <0.6.0;\r\n\r\ncontract crowd...
      RETURNDATASIZE 			r Struct\r\n    st
      PUSH 0			n
      REVERT 			   //Funder Struct\r\n    str
    tag 62			a 
      JUMPDEST 			a 
      POP 			allFunders[a].transfer(address...
      DUP1 			a++
      DUP1 			a++
      PUSH 1			a++
      ADD 			a++
      SWAP2 			a++
      POP 			a++
      POP 			a++
      PUSH [tag] 55			for(uint a = 0; a<allFunders.l...
      JUMP 			for(uint a = 0; a<allFunders.l...
    tag 56			for(uint a = 0; a<allFunders.l...
      JUMPDEST 			for(uint a = 0; a<allFunders.l...
      POP 			for(uint a = 0; a<allFunders.l...
      POP 			return;
      POP 			return;
      POP 			return;
      PUSH [tag] 42			return;
      JUMP 			return;