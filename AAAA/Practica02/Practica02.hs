data Elemento = Asahelio | Arturano | Arsenico | Alaneon | Quirozono |Johnson deriving(Eq, Show)

instance Enum Elemento where
  toEnum 6 = Johnson
  toEnum 5 = Quirozono
  toEnum 4 = Alaneon
  toEnum 3 = Arsenico
  toEnum 2 = Asahelio
  toEnum 1 = Arturano

  fromEnum Johnson = 6
  fromEnum Quirozono = 5
  fromEnum Alaneon = 4
  fromEnum Arsenico = 3
  fromEnum Asahelio = 2
  fromEnum Arturano = 1
