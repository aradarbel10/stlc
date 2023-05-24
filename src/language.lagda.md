```agda
module language where

open import context public
```

## Core Language
In STLC the types can be simply defined as a regular ADT.
```agda
infix 25 _⇒_
data type : Set where
  𝔹 : type
  _⇒_ : type → type → type
```
To define the terms of the language we give an "intrinsically typed" representation, which indexes each term by its type and guarantees all terms of the core language are well-typed.
```agda
infix 15 _⊣_
data _⊣_ : type → Ctx type → Set where
  var : ∀{τ Γ} → τ ∈ Γ → τ ⊣ Γ
  lam : ∀{τ σ Γ} → σ ⊣ Γ , τ → τ ⇒ σ ⊣ Γ
  app : ∀{τ σ Γ} → (τ ⇒ σ) ⊣ Γ → τ ⊣ Γ → σ ⊣ Γ
  tt ff : ∀{Γ} → 𝔹 ⊣ Γ
  if_then_else_ : ∀{τ Γ} → 𝔹 ⊣ Γ → τ ⊣ Γ → τ ⊣ Γ → τ ⊣ Γ
```

## Values
Those are irreducible expressions. Intuitively, we can think that "evaluation is done" on them.
```agda
data value {Γ : Ctx type} : {τ : type} → τ ⊣ Γ → Set where
  tt : value tt
  ff : value ff
  lam : ∀{τ σ} → (e : σ ⊣ Γ , τ) → value (lam e)
```