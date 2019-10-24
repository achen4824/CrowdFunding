      PUSH 0			uint i
      DUP1 			0
      SWAP1 			uint i = 0
      POP 			uint i = 0
    tag 44			for(uint i = 0;i<values.length...
      JUMPDEST 			for(uint i = 0;i<values.length...
      PUSH 2			values
      DUP1 			values.length
      SLOAD 			values.length
      SWAP1 			values.length
      POP 			values.length
      DUP2 			i
      LT 			i<values.length
      ISZERO 			for(uint i = 0;i<values.length...
      PUSH [tag] 45			for(uint i = 0;i<values.length...
      JUMPI 			for(uint i = 0;i<values.length...
      PUSH 1			goal
      SLOAD 			goal
      PUSH 2			values
      DUP3 			i
      DUP2 			values[i]
      SLOAD 			values[i]
      DUP2 			values[i]
      LT 			values[i]
      PUSH [tag] 47			values[i]
      JUMPI 			values[i]
      INVALID 			values[i]
    tag 47			values[i]
      JUMPDEST 			values[i]
      SWAP1 			values[i]
      PUSH 0			values[i]
      MSTORE 			values[i]
      PUSH 20			values[i]
      PUSH 0			values[i]
      KECCAK256 			values[i]
      ADD 			values[i]
      SLOAD 			values[i]
      PUSH 7			indexes
      PUSH 0			indexes[values[i]]
      PUSH 2			values
      DUP6 			i
      DUP2 			values[i]
      SLOAD 			values[i]
      DUP2 			values[i]
      LT 			values[i]
      PUSH [tag] 49			values[i]
      JUMPI 			values[i]
      INVALID 			values[i]
    tag 49			values[i]
      JUMPDEST 			values[i]
      SWAP1 			values[i]
      PUSH 0			values[i]
      MSTORE 			values[i]
      PUSH 20			values[i]
      PUSH 0			values[i]
      KECCAK256 			values[i]
      ADD 			values[i]
      SLOAD 			values[i]
      DUP2 			indexes[values[i]]
      MSTORE 			indexes[values[i]]
      PUSH 20			indexes[values[i]]
      ADD 			indexes[values[i]]
      SWAP1 			indexes[values[i]]
      DUP2 			indexes[values[i]]
      MSTORE 			indexes[values[i]]
      PUSH 20			indexes[values[i]]
      ADD 			indexes[values[i]]
      PUSH 0			indexes[values[i]]
      KECCAK256 			indexes[values[i]]
      SLOAD 			indexes[values[i]]
      MUL 			indexes[values[i]]*int(values[...
      SGT 			indexes[values[i]]*int(values[...
      ISZERO 			if(indexes[values[i]]*int(valu...
      PUSH [tag] 51			if(indexes[values[i]]*int(valu...
      JUMPI 			if(indexes[values[i]]*int(valu...
      PUSH 2			values
      DUP2 			i
      DUP2 			values[i]
      SLOAD 			values[i]
      DUP2 			values[i]
      LT 			values[i]
      PUSH [tag] 52			values[i]
      JUMPI 			values[i]
      INVALID 			values[i]
    tag 52			values[i]
      JUMPDEST 			values[i]
      SWAP1 			values[i]
      PUSH 0			values[i]
      MSTORE 			values[i]
      PUSH 20			values[i]
      PUSH 0			values[i]
      KECCAK256 			values[i]
      ADD 			values[i]
      SLOAD 			values[i]
      SWAP4 			finalValue = int(values[i])
      POP 			finalValue = int(values[i])
      PUSH [tag] 45			break
      JUMP 			break
    tag 51			if(indexes[values[i]]*int(valu...
      JUMPDEST 			if(indexes[values[i]]*int(valu...
      DUP1 			i++
      DUP1 			i++
      PUSH 1			i++
      ADD 			i++
      SWAP2 			i++
      POP 			i++
      POP 			i++
      PUSH [tag] 44			for(uint i = 0;i<values.length...
      JUMP 			for(uint i = 0;i<values.length...
    tag 45			for(uint i = 0;i<values.length...
      JUMPDEST 			for(uint i = 0;i<values.length...
      POP 			for(uint i = 0;i<values.length...