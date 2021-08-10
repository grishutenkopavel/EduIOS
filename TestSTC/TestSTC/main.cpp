//
//  main.cpp
//  TestSTC
//
//  Created by Павел Гришутенко on 03.08.2021.
//

#include <iostream>
#include <math.h>

float genNoize(float d){
    float n = rand();
    while (n > d){
        n /= 10;
    }
    return d - 4 * n;
}

//генерация зашумленного сигнала
int generateSignal(float* y, float* x, const int h){
    const float d = 1/float(h); // величина шага
    float acc = 0.f; // аккумулятор
    for (int i = 0; i < h; i++){
        x[i] = acc;
        float noize = genNoize(d);
        y[i] = cos(x[i]) + noize; // генерирующая функция
        printf("clear y = %f, y = %f\n", y[i] - noize, y[i]);
        acc += d;
    }
    return 0;
}

int filterFIR(float* y, float* x, const int h){
    int t = 0;
    const float filtrKoef[] = {0.135, -0.135, -0.027, 0.027, 0.0135, -0.135, -0.027, 0.027,
                                0.027, 0.0135, -0.0135, -0.027, 0.027, 0.0135, 0.027, 0.027
                                };
    float acc = 0.f;
    for (int i = 0; i < h; i++){
        acc = 0.f;
        
        for (int j = 0; j < 16; j++){
            acc += filtrKoef[j] * x[j];
        }
        printf("acc = %f ", acc);
        y[i] += acc ;
        printf("filtering y = %f\n", y[i]);
        t = x[0];
        for(int j = 0; j < h; j++){
            x[j] = x[j+1];
        }
        x[h] = t;
        
        
    }
    return 0;
}


int main(int argc, const char* argv[]) {
    const int h = 50; // количество шагов
    float y[h], x[h];
    srand((unsigned int)time(NULL));
    
    generateSignal(&y[0], &x[0], h);

    printf("\n");
    
    filterFIR(&y[0], &x[0], h);
    
    return 0;
}
