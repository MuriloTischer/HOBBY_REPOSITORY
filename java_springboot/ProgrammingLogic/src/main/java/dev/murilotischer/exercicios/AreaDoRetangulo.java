package dev.murilotischer.exercicios;

import java.util.Scanner;

/**
 * @author MURILO TISCHER
 */

/*
 Escreva um algoritmo para ler as dimensões de um retângulo (base e altura),
 calcular e escrever a área do retângulo.*/

public class AreaDoRetangulo {


    public static void main(String[] args) {
        int areaDoRetangulo, baseDoRetangulo, alturaDoRetangulo; // propriedades

        Scanner scan = new Scanner(System.in); //responsavel por receber e informar o que o usuario digita

        System.out.println("Informe o tamanho da base do retangulo: ");
        baseDoRetangulo = scan.nextInt(); //armazenando na propriedade o que foi informado pelo usuario
        System.out.println("Informe o tamanho da altura do retangulo: ");
        alturaDoRetangulo = scan.nextInt(); //armazenando na propriedade o que foi informado pelo usuario

        areaDoRetangulo = baseDoRetangulo * alturaDoRetangulo; //calculando e  armezanando na prorpiedade o valor obtido

        System.out.println("A area do retangulo para os valores informados é: " + areaDoRetangulo); //apresentando o calculo final para o usuario

    }


}