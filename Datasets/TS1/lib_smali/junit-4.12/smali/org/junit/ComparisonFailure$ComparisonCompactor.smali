.class Lorg/junit/ComparisonFailure$ComparisonCompactor;
.super Ljava/lang/Object;
.source "ComparisonFailure.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/ComparisonFailure;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ComparisonCompactor"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;
    }
.end annotation


# static fields
.field private static final DIFF_END:Ljava/lang/String; = "]"

.field private static final DIFF_START:Ljava/lang/String; = "["

.field private static final ELLIPSIS:Ljava/lang/String; = "..."


# instance fields
.field private final actual:Ljava/lang/String;

.field private final contextLength:I

.field private final expected:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "contextLength"    # I
    .param p2, "expected"    # Ljava/lang/String;
    .param p3, "actual"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput p1, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->contextLength:I

    .line 91
    iput-object p2, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    .line 92
    iput-object p3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->actual:Ljava/lang/String;

    .line 93
    return-void
.end method

.method static synthetic access$100(Lorg/junit/ComparisonFailure$ComparisonCompactor;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/junit/ComparisonFailure$ComparisonCompactor;

    .prologue
    .line 70
    invoke-direct {p0}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->sharedPrefix()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lorg/junit/ComparisonFailure$ComparisonCompactor;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Lorg/junit/ComparisonFailure$ComparisonCompactor;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->sharedSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lorg/junit/ComparisonFailure$ComparisonCompactor;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/junit/ComparisonFailure$ComparisonCompactor;

    .prologue
    .line 70
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lorg/junit/ComparisonFailure$ComparisonCompactor;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/junit/ComparisonFailure$ComparisonCompactor;

    .prologue
    .line 70
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->actual:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lorg/junit/ComparisonFailure$ComparisonCompactor;)I
    .registers 2
    .param p0, "x0"    # Lorg/junit/ComparisonFailure$ComparisonCompactor;

    .prologue
    .line 70
    iget v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->contextLength:I

    return v0
.end method

.method private sharedPrefix()Ljava/lang/String;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 109
    iget-object v2, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->actual:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 110
    .local v0, "end":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    if-ge v1, v0, :cond_2c

    .line 111
    iget-object v2, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->actual:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_29

    .line 112
    iget-object v2, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    invoke-virtual {v2, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 115
    :goto_28
    return-object v2

    .line 110
    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 115
    :cond_2c
    iget-object v2, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    invoke-virtual {v2, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_28
.end method

.method private sharedSuffix(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 119
    const/4 v1, 0x0

    .line 120
    .local v1, "suffixLength":I
    iget-object v2, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v2, v3

    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->actual:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .line 122
    .local v0, "maxSuffixLength":I
    :goto_1d
    if-gt v1, v0, :cond_3f

    .line 123
    iget-object v2, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    sub-int/2addr v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->actual:Ljava/lang/String;

    iget-object v4, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->actual:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    sub-int/2addr v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_4d

    .line 128
    :cond_3f
    iget-object v2, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 122
    :cond_4d
    add-int/lit8 v1, v1, 0x1

    goto :goto_1d
.end method


# virtual methods
.method public compact(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 96
    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    if-eqz v3, :cond_12

    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->actual:Ljava/lang/String;

    if-eqz v3, :cond_12

    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    iget-object v4, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->actual:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 97
    :cond_12
    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;

    iget-object v4, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor;->actual:Ljava/lang/String;

    invoke-static {p1, v3, v4}, Lorg/junit/Assert;->format(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 102
    :goto_1a
    return-object v3

    .line 99
    :cond_1b
    new-instance v2, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;-><init>(Lorg/junit/ComparisonFailure$ComparisonCompactor;Lorg/junit/ComparisonFailure$1;)V

    .line 100
    .local v2, "extractor":Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;
    invoke-virtual {v2}, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->compactPrefix()Ljava/lang/String;

    move-result-object v0

    .line 101
    .local v0, "compactedPrefix":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->compactSuffix()Ljava/lang/String;

    move-result-object v1

    .line 102
    .local v1, "compactedSuffix":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->expectedDiff()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->actualDiff()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v3, v4}, Lorg/junit/Assert;->format(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1a
.end method
