    PUSH 0			0
      DUP2 			values[0]
      SLOAD 			values[0]
      DUP2 			values[0]
      LT 			values[0]
      PUSH [tag] 64			values[0]
      JUMPI 			values[0]
      INVALID 			values[0]
    tag 64			values[0]
      JUMPDEST 			values[0]
      SWAP1 			values[0]
      PUSH 0			values[0]
      MSTORE 			values[0]
      PUSH 20			values[0]
      PUSH 0			values[0]
      KECCAK256 			values[0]
      ADD 			values[0]
      SLOAD 			values[0]
      DUP4 			finalValue
      EQ 			finalValue != int(values[0])
      PUSH [tag] 66			if(finalValue != int(values[0]...
      JUMPI 			if(finalValue != int(values[0]...
      PUSH 0			uint a
      DUP1 			0
      SWAP1 			uint a = 0
      POP 			uint a = 0
    tag 67			for(uint a = 0; a<allFunders.l...
      JUMPDEST 			for(uint a = 0; a<allFunders.l...
      PUSH 5			allFunders
      DUP1 			allFunders.length
      SLOAD 			allFunders.length
      SWAP1 			allFunders.length
      POP 			allFunders.length
      DUP2 			a
      LT 			a<allFunders.length
      ISZERO 			for(uint a = 0; a<allFunders.l...
      PUSH [tag] 68			for(uint a = 0; a<allFunders.l...
      JUMPI 			for(uint a = 0; a<allFunders.l...
      DUP4 			finalValue
      PUSH 6			addressToValue
      PUSH 0			addressToValue[allFunders[a]]
      PUSH 5			allFunders
      DUP5 			a
      DUP2 			allFunders[a]
      SLOAD 			allFunders[a]
      DUP2 			allFunders[a]
      LT 			allFunders[a]
      PUSH [tag] 70			allFunders[a]
      JUMPI 			allFunders[a]
      INVALID 			allFunders[a]
    tag 70			allFunders[a]
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
      LT 			addressToValue[allFunders[a]]....
      ISZERO 			if(addressToValue[allFunders[a...
      PUSH [tag] 72			if(addressToValue[allFunders[a...
      JUMPI 			if(addressToValue[allFunders[a...
      PUSH 5			allFunders
      DUP2 			a
      DUP2 			allFunders[a]
      SLOAD 			allFunders[a]
      DUP2 			allFunders[a]
      LT 			allFunders[a]
      PUSH [tag] 73			allFunders[a]
      JUMPI 			allFunders[a]
      INVALID 			allFunders[a]
    tag 73			allFunders[a]
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
      PUSH [tag] 75			allFunders[a]
      JUMPI 			allFunders[a]
      INVALID 			allFunders[a]
    tag 75			allFunders[a]
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
      PUSH [tag] 77			a 
      JUMPI 			a 
      RETURNDATASIZE 			crowdfunding{\r\n 
      PUSH 0			c
      DUP1 			t
      RETURNDATACOPY 			 <0.6.0;\r\n\r\ncontract crowd...
      RETURNDATASIZE 			r Struct\r\n    st
      PUSH 0			n
      REVERT 			   //Funder Struct\r\n    str
    tag 77			a 
      JUMPDEST 			a 
      POP 			allFunders[a].transfer(address...
      PUSH 6			addressToValue
      PUSH 0			addressToValue[allFunders[a]]
      PUSH 5			allFunders
      DUP4 			a
      DUP2 			allFunders[a]
      SLOAD 			allFunders[a]
      DUP2 			allFunders[a]
      LT 			allFunders[a]
      PUSH [tag] 78			allFunders[a]
      JUMPI 			allFunders[a]
      INVALID 			allFunders[a]
    tag 78			allFunders[a]
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
      PUSH 0			addressToValue[allFunders[a]]
      DUP1 			delete addressToValue[allFunde...
      DUP3 			delete addressToValue[allFunde...
      ADD 			delete addressToValue[allFunde...
      PUSH 0			delete addressToValue[allFunde...
      SWAP1 			delete addressToValue[allFunde...
      SSTORE 			delete addressToValue[allFunde...
      PUSH 1			delete addressToValue[allFunde...
      DUP3 			delete addressToValue[allFunde...
      ADD 			delete addressToValue[allFunde...
      PUSH 0			delete addressToValue[allFunde...
      SWAP1 			delete addressToValue[allFunde...
      SSTORE 			delete addressToValue[allFunde...
      POP 			delete addressToValue[allFunde...
      POP 			delete addressToValue[allFunde...
      PUSH 5			allFunders
      DUP2 			a
      DUP2 			allFunders[a]
      SLOAD 			allFunders[a]
      DUP2 			allFunders[a]
      LT 			allFunders[a]
      PUSH [tag] 80			allFunders[a]
      JUMPI 			allFunders[a]
      INVALID 			allFunders[a]
    tag 80			allFunders[a]
      JUMPDEST 			allFunders[a]
      SWAP1 			allFunders[a]
      PUSH 0			allFunders[a]
      MSTORE 			allFunders[a]
      PUSH 20			allFunders[a]
      PUSH 0			allFunders[a]
      KECCAK256 			allFunders[a]
      ADD 			allFunders[a]
      PUSH 0			allFunders[a]
      PUSH 100			delete allFunders[a]
      EXP 			delete allFunders[a]
      DUP2 			delete allFunders[a]
      SLOAD 			delete allFunders[a]
      SWAP1 			delete allFunders[a]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			delete allFunders[a]
      MUL 			delete allFunders[a]
      NOT 			delete allFunders[a]
      AND 			delete allFunders[a]
      SWAP1 			delete allFunders[a]
      SSTORE 			delete allFunders[a]
      DUP2 			trueLength--
      DUP1 			trueLength--
      PUSH 1			trueLength--
      SWAP1 			trueLength--
      SUB 			trueLength--
      SWAP3 			trueLength--
      POP 			trueLength--
      POP 			trueLength--
    tag 72			if(addressToValue[allFunders[a...
      JUMPDEST 			if(addressToValue[allFunders[a...
      DUP1 			a++
      DUP1 			a++
      PUSH 1			a++
      ADD 			a++
      SWAP2 			a++
      POP 			a++
      POP 			a++
      PUSH [tag] 67			for(uint a = 0; a<allFunders.l...
      JUMP 			for(uint a = 0; a<allFunders.l...
    tag 68			for(uint a = 0; a<allFunders.l...
      JUMPDEST 			for(uint a = 0; a<allFunders.l...
      POP 			for(uint a = 0; a<allFunders.l...
      PUSH 1			1
      DUP2 			trueLength
      PUSH 1			goal
      SLOAD 			goal
      DUP2 			goal /int(trueLength)
      PUSH [tag] 82			goal /int(trueLength)
      JUMPI 			goal /int(trueLength)
      INVALID 			goal /int(trueLength)
    tag 82			goal /int(trueLength)
      JUMPDEST 			goal /int(trueLength)
      SDIV 			goal /int(trueLength)
      ADD 			(goal /int(trueLength))+1
      SWAP2 			price = (goal /int(trueLength)...
      POP 			price = (goal /int(trueLength)...
    tag 66			if(finalValue != int(values[0]...
      JUMPDEST 			if(finalValue != int(values[0]...
      PUSH 0			uint iter
      DUP1 			0
      SWAP1 			uint iter = 0
      POP 			uint iter = 0
    tag 83			while (trueLength > 0){\r\n   ...
      JUMPDEST 			while (trueLength > 0){\r\n   ...
      PUSH 0			0
      DUP3 			trueLength
      GT 			trueLength > 0
      ISZERO 			while (trueLength > 0){\r\n   ...
      PUSH [tag] 84			while (trueLength > 0){\r\n   ...
      JUMPI 			while (trueLength > 0){\r\n   ...
      PUSH 0			0
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			allFunders[iter] != address(0)
      AND 			allFunders[iter] != address(0)
      PUSH 5			allFunders
      DUP3 			iter
      DUP2 			allFunders[iter]
      SLOAD 			allFunders[iter]
      DUP2 			allFunders[iter]
      LT 			allFunders[iter]
      PUSH [tag] 85			allFunders[iter]
      JUMPI 			allFunders[iter]
      INVALID 			allFunders[iter]
    tag 85			allFunders[iter]
      JUMPDEST 			allFunders[iter]
      SWAP1 			allFunders[iter]
      PUSH 0			allFunders[iter]
      MSTORE 			allFunders[iter]
      PUSH 20			allFunders[iter]
      PUSH 0			allFunders[iter]
      KECCAK256 			allFunders[iter]
      ADD 			allFunders[iter]
      PUSH 0			allFunders[iter]
      SWAP1 			allFunders[iter]
      SLOAD 			allFunders[iter]
      SWAP1 			allFunders[iter]
      PUSH 100			allFunders[iter]
      EXP 			allFunders[iter]
      SWAP1 			allFunders[iter]
      DIV 			allFunders[iter]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			allFunders[iter]
      AND 			allFunders[iter]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			allFunders[iter] != address(0)
      AND 			allFunders[iter] != address(0)
      EQ 			allFunders[iter] != address(0)
      PUSH [tag] 87			if(allFunders[iter] != address...
      JUMPI 			if(allFunders[iter] != address...
      PUSH 5			allFunders
      DUP2 			iter
      DUP2 			allFunders[iter]
      SLOAD 			allFunders[iter]
      DUP2 			allFunders[iter]
      LT 			allFunders[iter]
      PUSH [tag] 88			allFunders[iter]
      JUMPI 			allFunders[iter]
      INVALID 			allFunders[iter]
    tag 88			allFunders[iter]
      JUMPDEST 			allFunders[iter]
      SWAP1 			allFunders[iter]
      PUSH 0			allFunders[iter]
      MSTORE 			allFunders[iter]
      PUSH 20			allFunders[iter]
      PUSH 0			allFunders[iter]
      KECCAK256 			allFunders[iter]
      ADD 			allFunders[iter]
      PUSH 0			allFunders[iter]
      SWAP1 			allFunders[iter]
      SLOAD 			allFunders[iter]
      SWAP1 			allFunders[iter]
      PUSH 100			allFunders[iter]
      EXP 			allFunders[iter]
      SWAP1 			allFunders[iter]
      DIV 			allFunders[iter]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			allFunders[iter]
      AND 			allFunders[iter]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			allFunders[iter].transfer
      AND 			allFunders[iter].transfer
      PUSH 8FC			allFunders[iter].transfer(addr...
      DUP5 			price
      PUSH 6			addressToValue
      PUSH 0			addressToValue[allFunders[iter...
      PUSH 5			allFunders
      DUP7 			iter
      DUP2 			allFunders[iter]
      SLOAD 			allFunders[iter]
      DUP2 			allFunders[iter]
      LT 			allFunders[iter]
      PUSH [tag] 90			allFunders[iter]
      JUMPI 			allFunders[iter]
      INVALID 			allFunders[iter]
    tag 90			allFunders[iter]
      JUMPDEST 			allFunders[iter]
      SWAP1 			allFunders[iter]
      PUSH 0			allFunders[iter]
      MSTORE 			allFunders[iter]
      PUSH 20			allFunders[iter]
      PUSH 0			allFunders[iter]
      KECCAK256 			allFunders[iter]
      ADD 			allFunders[iter]
      PUSH 0			allFunders[iter]
      SWAP1 			allFunders[iter]
      SLOAD 			allFunders[iter]
      SWAP1 			allFunders[iter]
      PUSH 100			allFunders[iter]
      EXP 			allFunders[iter]
      SWAP1 			allFunders[iter]
      DIV 			allFunders[iter]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			allFunders[iter]
      AND 			allFunders[iter]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			addressToValue[allFunders[iter...
      AND 			addressToValue[allFunders[iter...
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			addressToValue[allFunders[iter...
      AND 			addressToValue[allFunders[iter...
      DUP2 			addressToValue[allFunders[iter...
      MSTORE 			addressToValue[allFunders[iter...
      PUSH 20			addressToValue[allFunders[iter...
      ADD 			addressToValue[allFunders[iter...
      SWAP1 			addressToValue[allFunders[iter...
      DUP2 			addressToValue[allFunders[iter...
      MSTORE 			addressToValue[allFunders[iter...
      PUSH 20			addressToValue[allFunders[iter...
      ADD 			addressToValue[allFunders[iter...
      PUSH 0			addressToValue[allFunders[iter...
      KECCAK256 			addressToValue[allFunders[iter...
      PUSH 0			addressToValue[allFunders[iter...
      ADD 			addressToValue[allFunders[iter...
      SLOAD 			addressToValue[allFunders[iter...
      SUB 			addressToValue[allFunders[iter...
      SWAP1 			allFunders[iter].transfer(addr...
      DUP2 			allFunders[iter].transfer(addr...
      ISZERO 			allFunders[iter].transfer(addr...
      MUL 			allFunders[iter].transfer(addr...
      SWAP1 			allFunders[iter].transfer(addr...
      PUSH 40			allFunders[iter].transfer(addr...
      MLOAD 			allFunders[iter].transfer(addr...
      PUSH 0			allFunders[iter].transfer(addr...
      PUSH 40			allFunders[iter].transfer(addr...
      MLOAD 			allFunders[iter].transfer(addr...
      DUP1 			allFunders[iter].transfer(addr...
      DUP4 			allFunders[iter].transfer(addr...
      SUB 			allFunders[iter].transfer(addr...
      DUP2 			allFunders[iter].transfer(addr...
      DUP6 			allFunders[iter].transfer(addr...
      DUP9 			allFunders[iter].transfer(addr...
      DUP9 			allFunders[iter].transfer(addr...
      CALL 			allFunders[iter].transfer(addr...
      SWAP4 			allFunders[iter].transfer(addr...
      POP 			allFunders[iter].transfer(addr...
      POP 			allFunders[iter].transfer(addr...
      POP 			allFunders[iter].transfer(addr...
      POP 			allFunders[iter].transfer(addr...
      ISZERO 			allFunders[iter].transfer(addr...
      DUP1 			olidity >
      ISZERO 			a 
      PUSH [tag] 92			a 
      JUMPI 			a 
      RETURNDATASIZE 			crowdfunding{\r\n 
      PUSH 0			c
      DUP1 			t
      RETURNDATACOPY 			 <0.6.0;\r\n\r\ncontract crowd...
      RETURNDATASIZE 			r Struct\r\n    st
      PUSH 0			n
      REVERT 			   //Funder Struct\r\n    str
    tag 92			a 
      JUMPDEST 			a 
      POP 			allFunders[iter].transfer(addr...
      PUSH 4			funderList
      PUSH 5			allFunders
      DUP3 			iter
      DUP2 			allFunders[iter]
      SLOAD 			allFunders[iter]
      DUP2 			allFunders[iter]
      LT 			allFunders[iter]
      PUSH [tag] 93			allFunders[iter]
      JUMPI 			allFunders[iter]
      INVALID 			allFunders[iter]
    tag 93			allFunders[iter]
      JUMPDEST 			allFunders[iter]
      SWAP1 			allFunders[iter]
      PUSH 0			allFunders[iter]
      MSTORE 			allFunders[iter]
      PUSH 20			allFunders[iter]
      PUSH 0			allFunders[iter]
      KECCAK256 			allFunders[iter]
      ADD 			allFunders[iter]
      PUSH 0			allFunders[iter]
      SWAP1 			allFunders[iter]
      SLOAD 			allFunders[iter]
      SWAP1 			allFunders[iter]
      PUSH 100			allFunders[iter]
      EXP 			allFunders[iter]
      SWAP1 			allFunders[iter]
      DIV 			allFunders[iter]
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			allFunders[iter]
      AND 			allFunders[iter]
      SWAP1 			funderList.push(allFunders[ite...
      DUP1 			funderList.push(allFunders[ite...
      PUSH 1			t
      DUP2 			\n\r\n
      SLOAD 			.6.0;\r\n\r\nc
      ADD 			2 <0.6.0;\r\n\r\ncontr
      DUP1 			{\r\n    \r\n 
      DUP3 			ndi
      SSTORE 			crowdfunding{\r\n    \r\n  
      DUP1 			Struct\r\n  
      SWAP2 			Funder Struct\r\n  
      POP 			Funder Struct\r\n  
      POP 			pragma solidity >=0.4.22 <0.6....
      SWAP1 			funderList.push(allFunders[ite...
      PUSH 1			funderList.push(allFunders[ite...
      DUP3 			funderList.push(allFunders[ite...
      SUB 			funderList.push(allFunders[ite...
      SWAP1 			funderList.push(allFunders[ite...
      PUSH 0			funderList.push(allFunders[ite...
      MSTORE 			funderList.push(allFunders[ite...
      PUSH 20			funderList.push(allFunders[ite...
      PUSH 0			funderList.push(allFunders[ite...
      KECCAK256 			funderList.push(allFunders[ite...
      ADD 			funderList.push(allFunders[ite...
      PUSH 0			funderList.push(allFunders[ite...
      SWAP1 			funderList.push(allFunders[ite...
      SWAP2 			funderList.push(allFunders[ite...
      SWAP3 			funderList.push(allFunders[ite...
      SWAP1 			funderList.push(allFunders[ite...
      SWAP2 			funderList.push(allFunders[ite...
      SWAP1 			funderList.push(allFunders[ite...
      SWAP2 			funderList.push(allFunders[ite...
      PUSH 100			funderList.push(allFunders[ite...
      EXP 			funderList.push(allFunders[ite...
      DUP2 			funderList.push(allFunders[ite...
      SLOAD 			funderList.push(allFunders[ite...
      DUP2 			funderList.push(allFunders[ite...
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			funderList.push(allFunders[ite...
      MUL 			funderList.push(allFunders[ite...
      NOT 			funderList.push(allFunders[ite...
      AND 			funderList.push(allFunders[ite...
      SWAP1 			funderList.push(allFunders[ite...
      DUP4 			funderList.push(allFunders[ite...
      PUSH FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF			funderList.push(allFunders[ite...
      AND 			funderList.push(allFunders[ite...
      MUL 			funderList.push(allFunders[ite...
      OR 			funderList.push(allFunders[ite...
      SWAP1 			funderList.push(allFunders[ite...
      SSTORE 			funderList.push(allFunders[ite...
      POP 			funderList.push(allFunders[ite...
      POP 			funderList.push(allFunders[ite...
      DUP2 			trueLength--
      DUP1 			trueLength--
      PUSH 1			trueLength--
      SWAP1 			trueLength--
      SUB 			trueLength--
      SWAP3 			trueLength--
      POP 			trueLength--
      POP 			trueLength--
    tag 87			if(allFunders[iter] != address...
      JUMPDEST 			if(allFunders[iter] != address...
      DUP1 			iter++
      DUP1 			iter++
      PUSH 1			iter++
      ADD 			iter++
      SWAP2 			iter++
      POP 			iter++
      POP 			iter++
      PUSH [tag] 83			while (trueLength > 0){\r\n   ...
      JUMP 			while (trueLength > 0){\r\n   ...
    tag 84			while (trueLength > 0){\r\n   ...
      JUMPDEST 			while (trueLength > 0){\r\n   ...
      PUSH 2			values
      PUSH 0			values
      PUSH [tag] 96			delete values
      SWAP2 			delete values
      SWAP1 			delete values
      PUSH [tag] 97			delete values
      JUMP [in]			delete values
    tag 96			delete values
      JUMPDEST 			delete values
      PUSH 1			goal
      PUSH 0			delete goal
      SWAP1 			delete goal
      SSTORE 			delete goal
      PUSH 0			finishTime
      DUP1 			delete finishTime
      SWAP1 			delete finishTime
      SSTORE 			delete finishTime
      POP 			function finishFunding() publi...
      POP 			function finishFunding() publi...
      POP 			function finishFunding() publi...
      POP 			function finishFunding() publi...
    tag 42			function finishFunding() publi...
      JUMPDEST 			function finishFunding() publi...
      JUMP [out]			function finishFunding() publi...