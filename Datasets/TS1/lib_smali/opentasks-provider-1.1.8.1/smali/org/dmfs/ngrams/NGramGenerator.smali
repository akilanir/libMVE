.class public final Lorg/dmfs/ngrams/NGramGenerator;
.super Ljava/lang/Object;


# static fields
.field private static final SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

.field private static final SEPARATOR_PATTERN_NO_NUMBERS:Ljava/util/regex/Pattern;


# instance fields
.field private mAddSpaceInFront:Z

.field private mAllLowercase:Z

.field private mLocale:Ljava/util/Locale;

.field private final mMinWordLen:I

.field private final mN:I

.field private mReturnNumbers:Z

.field private mTempArray:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "[^\\p{L}\\p{M}\\d]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/dmfs/ngrams/NGramGenerator;->SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    const-string v0, "[^\\p{L}\\p{M}]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/dmfs/ngrams/NGramGenerator;->SEPARATOR_PATTERN_NO_NUMBERS:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/dmfs/ngrams/NGramGenerator;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .registers 6

    const/4 v0, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lorg/dmfs/ngrams/NGramGenerator;->mAllLowercase:Z

    iput-boolean v0, p0, Lorg/dmfs/ngrams/NGramGenerator;->mReturnNumbers:Z

    iput-boolean v2, p0, Lorg/dmfs/ngrams/NGramGenerator;->mAddSpaceInFront:Z

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/ngrams/NGramGenerator;->mLocale:Ljava/util/Locale;

    iput p1, p0, Lorg/dmfs/ngrams/NGramGenerator;->mN:I

    iput p2, p0, Lorg/dmfs/ngrams/NGramGenerator;->mMinWordLen:I

    new-array v0, p1, [C

    iput-object v0, p0, Lorg/dmfs/ngrams/NGramGenerator;->mTempArray:[C

    iget-object v0, p0, Lorg/dmfs/ngrams/NGramGenerator;->mTempArray:[C

    const/16 v1, 0x20

    aput-char v1, v0, v2

    return-void
.end method


# virtual methods
.method public getNgrams(Ljava/lang/String;)Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    invoke-virtual {p0, v0, p1}, Lorg/dmfs/ngrams/NGramGenerator;->getNgrams(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getNgrams(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-boolean v0, p0, Lorg/dmfs/ngrams/NGramGenerator;->mAllLowercase:Z

    if-eqz v0, :cond_a

    iget-object v0, p0, Lorg/dmfs/ngrams/NGramGenerator;->mLocale:Ljava/util/Locale;

    invoke-virtual {p2, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    :cond_a
    iget-boolean v0, p0, Lorg/dmfs/ngrams/NGramGenerator;->mReturnNumbers:Z

    if-eqz v0, :cond_2a

    sget-object v0, Lorg/dmfs/ngrams/NGramGenerator;->SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p2}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    :goto_15
    if-nez p1, :cond_1e

    new-instance p1, Ljava/util/HashSet;

    const/16 v0, 0x80

    invoke-direct {p1, v0}, Ljava/util/HashSet;-><init>(I)V

    :cond_1e
    array-length v2, v1

    const/4 v0, 0x0

    :goto_20
    if-ge v0, v2, :cond_32

    aget-object v3, v1, v0

    invoke-virtual {p0, v3, p1}, Lorg/dmfs/ngrams/NGramGenerator;->getNgrams(Ljava/lang/String;Ljava/util/Set;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    :cond_2a
    sget-object v0, Lorg/dmfs/ngrams/NGramGenerator;->SEPARATOR_PATTERN_NO_NUMBERS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p2}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto :goto_15

    :cond_32
    return-object p1
.end method

.method public getNgrams(Ljava/lang/String;Ljava/util/Set;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    iget v1, p0, Lorg/dmfs/ngrams/NGramGenerator;->mMinWordLen:I

    if-ge v2, v1, :cond_a

    :cond_9
    :goto_9
    return-void

    :cond_a
    iget v3, p0, Lorg/dmfs/ngrams/NGramGenerator;->mN:I

    const/4 v1, 0x1

    sub-int v4, v2, v3

    add-int/lit8 v4, v4, 0x1

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    move v1, v0

    :goto_16
    if-ge v1, v4, :cond_28

    add-int v5, v1, v3

    invoke-static {v5, v2}, Ljava/lang/Math;->min(II)I

    move-result v5

    invoke-virtual {p1, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-interface {p2, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    :cond_28
    iget-boolean v1, p0, Lorg/dmfs/ngrams/NGramGenerator;->mAddSpaceInFront:Z

    if-eqz v1, :cond_9

    iget-object v1, p0, Lorg/dmfs/ngrams/NGramGenerator;->mTempArray:[C

    add-int/lit8 v3, v3, -0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    :goto_34
    if-ge v0, v2, :cond_41

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    aput-char v4, v1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_34

    :cond_41
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9
.end method

.method public setAddSpaceInFront(Z)Lorg/dmfs/ngrams/NGramGenerator;
    .registers 2

    iput-boolean p1, p0, Lorg/dmfs/ngrams/NGramGenerator;->mAddSpaceInFront:Z

    return-object p0
.end method

.method public setAllLowercase(Z)Lorg/dmfs/ngrams/NGramGenerator;
    .registers 2

    iput-boolean p1, p0, Lorg/dmfs/ngrams/NGramGenerator;->mAllLowercase:Z

    return-object p0
.end method

.method public setLocale(Ljava/util/Locale;)Lorg/dmfs/ngrams/NGramGenerator;
    .registers 2

    iput-object p1, p0, Lorg/dmfs/ngrams/NGramGenerator;->mLocale:Ljava/util/Locale;

    return-object p0
.end method
