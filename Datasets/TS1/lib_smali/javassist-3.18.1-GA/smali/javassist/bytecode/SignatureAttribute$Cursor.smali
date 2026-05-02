.class Ljavassist/bytecode/SignatureAttribute$Cursor;
.super Ljava/lang/Object;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/SignatureAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Cursor"
.end annotation


# instance fields
.field position:I


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    return-void
.end method

.method synthetic constructor <init>(Ljavassist/bytecode/SignatureAttribute$1;)V
    .registers 2
    .param p1, "x0"    # Ljavassist/bytecode/SignatureAttribute$1;

    .prologue
    .line 160
    invoke-direct {p0}, Ljavassist/bytecode/SignatureAttribute$Cursor;-><init>()V

    return-void
.end method


# virtual methods
.method indexOf(Ljava/lang/String;I)I
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 164
    iget v1, p0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 165
    .local v0, "i":I
    if-gez v0, :cond_d

    .line 166
    # invokes: Ljavassist/bytecode/SignatureAttribute;->error(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;
    invoke-static {p1}, Ljavassist/bytecode/SignatureAttribute;->access$000(Ljava/lang/String;)Ljavassist/bytecode/BadBytecode;

    move-result-object v1

    throw v1

    .line 168
    :cond_d
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljavassist/bytecode/SignatureAttribute$Cursor;->position:I

    .line 169
    return v0
.end method
