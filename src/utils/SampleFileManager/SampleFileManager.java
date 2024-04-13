// Nome: Charles Lelis Braga - Matrícula: 202035015
// Nome: Gabriella Carvalho -- Matrícula: 202165047AC

package utils.SampleFileManager;

import java.io.File;
import java.util.Scanner;

public class SampleFileManager {
  static String sampleFolder = "samples/sintatic/";
  static Scanner scanner = new Scanner(System.in);

  public static File getSampleFile() throws Exception {
    File[] files = getFolders();
    return selectFile(files);
  }

  private static File[] getFolders() throws Exception {
    File directory_folder = new File(sampleFolder);
    File[] folders = directory_folder.listFiles();

    if (folders != null && folders.length != 0) {
      sampleFolder = selectFolder(folders);
    }

    File directory = new File(sampleFolder);
    File[] files = directory.listFiles();

    if (files == null || files.length == 0) {
      throw new Exception("Não há arquivos no diretório especificado.");
    }

    return files;
  }

  private static String selectFolder(File[] folders) {
    System.out.println("Selecione um pasta:");

    for (int i = 0; i < folders.length; i++) {
      System.out.println((i) + ". " + folders[i].getName());
    }

    int choice = -1;

    while (choice < 0 || choice > folders.length - 1) {
      System.out.print("Digite o número do pasta para selecionar: ");
      choice = scanner.nextInt();
    }

    File selectedFolder = folders[choice];
    System.out.println("Você selecionou: " + selectedFolder.getPath());

    return selectedFolder.getPath();
  }

  private static File selectFile(File[] files) {
    System.out.println("Selecione um arquivo: (/samples/sintatic/)");

    for (int i = 0; i < files.length; i++) {
      System.out.println((i + 1) + ". " + files[i].getName());
    }

    int choice = -1;

    while (choice < 1 || choice > files.length) {
      System.out.print("Digite o número do arquivo para selecionar: ");
      choice = scanner.nextInt();
    }

    File selectedFile = files[choice - 1];
    System.out.println("Você selecionou: " + selectedFile.getPath());

    return selectedFile;
  }

}
