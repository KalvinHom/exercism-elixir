defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}

  def of_rna(rna) do
    case of_rna(rna, []) do
      {:ok, codons} -> {:ok, Enum.reverse(codons)}
      err -> err
    end
  end

  defp of_rna("", codons), do: {:ok, codons}
  defp of_rna(rna, codons) do
    {codon, remainder} =
      rna
      |> String.split_at(3)


    case of_codon(codon) do
      {:error, _} -> {:error, "invalid RNA"}
      {:ok, "STOP"} -> {:ok, codons}
      {:ok, codon} -> of_rna(remainder, [codon | codons ])
    end
  end


  @codons %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @doc """
  Given a codon, return the corresponding protein


  UGU => Cysteine
  UGC => Cysteine
  UUA => Leucine
  UUG => Leucine
  AUG => Methionine
  UUU => Phenylalanine
  UUC => Phenylalanine
  UCU => Serine
  UCC => Serine
  UCA => Serine
  UCG => Serine
  UGG => Tryptophan
  UAU => Tyrosine
  UAC => Tyrosine
  UAA => STOP
  UAG => STOP
  UGA => STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    IO.puts(codon)
    codon = Map.get(@codons, codon)
    IO.puts(codon)
    case codon do
      nil -> {:error, "invalid codon"}
      c -> {:ok, c}
    end

  end
end
