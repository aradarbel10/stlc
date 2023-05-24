module utils where

open import Relation.Binary.PropositionalEquality
  using (_≡_; refl; trans; cong; cong₂; sym) public

cong₃ : ∀{ℓ} {A B C D : Set ℓ}
  → (f : A → B → C → D)
  → {a a′ : A} → a ≡ a′
  → {b b′ : B} → b ≡ b′
  → {c c′ : C} → c ≡ c′
  → f a b c ≡ f a′ b′ c′
cong₃ f refl refl refl = refl

open Relation.Binary.PropositionalEquality.≡-Reasoning public
open import Function.Base using (_∘_) public