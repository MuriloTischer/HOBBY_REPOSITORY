package dev.murilotischer.exercicios;

import java.text.DecimalFormat;
import java.util.Scanner;

/**
 * @author MURILO TISCHER
 */

/*Escreva um algoritmo para ler uma temperatura em graus Fahrenheit, calcular e escrever o valor
correspondente em graus Celsius (baseado na fórmula abaixo):
   C           F - 32
---------- = -----------
   5             9
*/
public class ConversaoDeTemperatura {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in); //reposavel por receber o valor informado pelo usuario
        double temperaturaEmFahrenheit, temperaturaEmCelsius; //propriedades

        System.out.println("Informe a temperatura em Fahrenheit: ");
        temperaturaEmFahrenheit = scan.nextDouble(); // recebe e armazena o que o usuario inserio

        temperaturaEmCelsius = ((temperaturaEmFahrenheit - 32) * 5 / 9); // realiza o calculo para conversão de valores

        DecimalFormat df = new DecimalFormat("#.##"); //formatando o valor para apresentar apenas duas casas decimais
        String temperatura = df.format(temperaturaEmCelsius); // transformando o valor em String

        System.out.println("A temperatura fahrenheit convertida em graus celsius é: ".concat(temperatura).concat(" graus")); //imprimindo e apresentando o calculo para o usuario


    }

}
