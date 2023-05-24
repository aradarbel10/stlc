```agda
module context where
```

# Contexts and membership
Contexts are defined like snoc-lists. Membership of a type within a context amounts to providing the (debruijn) index for where in the context that entry's type appears.
```agda
infixr 20 _,_
data Ctx (U : Set) : Set where
  ∙ : Ctx U
  _,_ : Ctx U → U → Ctx U

infix 15 _∈_
data _∈_ {U : Set} (τ : U) : Ctx U → Set where
  Z : ∀{Γ : Ctx U} → τ ∈ Γ , τ
  S : ∀{σ : U} {Γ : Ctx U} → τ ∈ Γ → τ ∈ Γ , σ
```