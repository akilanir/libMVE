.class Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$PrimeGenerator;
.super Ljava/lang/Object;
.source "IntegerPolynomial.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PrimeGenerator"
.end annotation


# instance fields
.field private index:I

.field private prime:Ljava/math/BigInteger;

.field final synthetic this$0:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;


# direct methods
.method private constructor <init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V
    .registers 3

    .prologue
    .line 1360
    iput-object p1, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$PrimeGenerator;->this$0:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1362
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$PrimeGenerator;->index:I

    return-void
.end method

.method synthetic constructor <init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .param p2, "x1"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$1;

    .prologue
    .line 1360
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$PrimeGenerator;-><init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V

    return-void
.end method


# virtual methods
.method public nextPrime()Ljava/math/BigInteger;
    .registers 4

    .prologue
    .line 1367
    iget v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$PrimeGenerator;->index:I

    # getter for: Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->BIGINT_PRIMES:Ljava/util/List;
    invoke-static {}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->access$300()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_21

    .line 1369
    # getter for: Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->BIGINT_PRIMES:Ljava/util/List;
    invoke-static {}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->access$300()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$PrimeGenerator;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$PrimeGenerator;->index:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/math/BigInteger;

    iput-object v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$PrimeGenerator;->prime:Ljava/math/BigInteger;

    .line 1376
    :goto_1e
    iget-object v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$PrimeGenerator;->prime:Ljava/math/BigInteger;

    return-object v0

    .line 1373
    :cond_21
    iget-object v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$PrimeGenerator;->prime:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->nextProbablePrime()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial$PrimeGenerator;->prime:Ljava/math/BigInteger;

    goto :goto_1e
.end method
