package dev.murilotischer.exercicios;

import java.util.Scanner;

/**
 * @author  - MURILOTISCHER em 01/07/2024
 */

//Escrever um programa que solicite ao usuário dois números e exiba a soma, subtração, multiplicação e divisão entre eles.

public class CalculosMatematicos {
    public static void main(String[] args) {

        int num1;
        int num2;
        int result;

        Scanner teclado = new Scanner(System.in);

        System.out.println("A seguir informe dois valores ");
        System.out.println("Informe o Primeiro valor: ");
        num1 = teclado.nextInt();
        System.out.println("Informe o Segundo valor: ");
        num2 = teclado.nextInt();

        result = num1 + num2;
        System.out.println("A soma de (" +num1+ " + " + num2 +  ") é = " + result);

        result = num1 - num2;
        System.out.println("A subtraçao de (" +num1+ " - " + num2 +  ") é = " + result);

        result = num1 * num2;
        System.out.println("A multiplicaçao de (" +num1+ " * " + num2 +  ") é = "  + result);

        result = num1 / num2;
        System.out.println("A divisao de ( " +num1+ " / " + num2 +  ") é = "  + result);

    }

}
