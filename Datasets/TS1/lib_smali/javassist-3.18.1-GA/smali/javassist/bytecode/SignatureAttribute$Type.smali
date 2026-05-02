.class public abstract Ljavassist/bytecode/SignatureAttribute$Type;
.super Ljava/lang/Object;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/SignatureAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Type"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 584
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static toString(Ljava/lang/StringBuffer;[Ljavassist/bytecode/SignatureAttribute$Type;)V
    .registers 4
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "ts"    # [Ljavassist/bytecode/SignatureAttribute$Type;

    .prologue
    .line 587
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_13

    .line 588
    if-lez v0, :cond_b

    .line 589
    const-string v1, ", "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 591
    :cond_b
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 587
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 593
    :cond_13
    return-void
.end method


# virtual methods
.method abstract encode(Ljava/lang/StringBuffer;)V
.end method
