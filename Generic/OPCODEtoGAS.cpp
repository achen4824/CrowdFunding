#include <iostream>
#include <map>
#include <string>
#include <cstring>
#include <sstream>
#include <fstream>
#include <unistd.h>
#include <fcntl.h> 

int main(int argc, char **argv){
    int stdin_copy = dup(0);
    int fd = open("opcodegasreference.csv",O_RDONLY);
    int newfd = dup2(fd, 0);
    
    std::map<std::string,int> opcodeToGas;

    //set opcodes
    std::string temp;
    while(std::getline(std::cin, temp)){
        std::stringstream ss(temp);
        std::string code;
        int num;
        for(int i = 0; i< 2 ; i++){
            std::getline(ss,temp,',');
            if(i == 0){
                code = temp;
            }else{
                num = std::stoi(temp);
            }
        }
        opcodeToGas[code] = num;
    }

    std::ifstream myfile;
    myfile.open (argv[1]);
    int sum = 0;
    while(std::getline(myfile,temp)){
        temp = strtok(&temp[0]," 1234567890");
        sum += opcodeToGas[temp];
    }
    myfile.close();
    std::cout << sum << std::endl;

}