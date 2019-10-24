#include <iostream>
#include <cstdlib>
#include <time.h>
#include <boost/multiprecision/cpp_int.hpp>

int main(){
    long users;
    long value;
    long goal;
    srand(time(NULL));
    
    int failrate = 0;

    for(int a = 0;a<1000000000;a++){

        users = rand() % 1000 +1;
        value = rand() % 10000 + 1;
        goal  = rand() % (users*value);

        //std::cout << "users " << users << " value " << value << " goal "<<goal << std::endl;

        int price;
        price = (goal/users);

        int sum = 0;
        if(price > value/2){
            int distance = value-price;
            for(int i =1;i<users+1;i++){
                long long tvalue;
                if(i < users/2){
                    tvalue = (((((2*i* (goal/users))/((users)))-(goal/users))*distance)/(goal/users))+1;
                }else if(i > users/2){
                    tvalue = (((((2*i* (goal/users))/((users)))-(goal/users))*distance)/ (goal/users))+1;
                }
                //std::cout << "estimated:\t"<< tvalue << std::endl;
                //std::cout << "real:\t\t\t"<< (2*float(i)/(float(users))-1)*distance << std::endl;
                sum+= price + tvalue + 1;
            }


        }else{
            int distance = price;
            for(int i =1;i<users+1;i++){
                long long tvalue;
                if(i < users/2){
                    tvalue = (((((2*i* (goal/users))/((users))))*distance)/ (goal/users)) ;
                }else if(i > users/2){
                    tvalue = (((((2*i* (goal/users))/((users))))*distance)/(goal/users));
                    
                }
                //std::cout << "estimated:\t"<< tvalue << std::endl;
                //std::cout << "real:\t\t\t"<< int((2*float(i)/(float(users))-1)*distance) << std::endl;
                sum+=tvalue;
            }
            
        }
        if(float(sum)/float(goal) * 100  < 100){
            failrate++;
        std::cout << "approximate: "<< float(sum)/float(goal) * 100  << std::endl;
        }
    }
    std::cout << failrate << std::endl;
}