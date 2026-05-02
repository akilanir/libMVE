.class Ljavassist/bytecode/AnnotationsAttribute$Renamer;
.super Ljavassist/bytecode/AnnotationsAttribute$Walker;
.source "AnnotationsAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/AnnotationsAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Renamer"
.end annotation


# instance fields
.field classnames:Ljava/util/Map;

.field cpool:Ljavassist/bytecode/ConstPool;


# direct methods
.method constructor <init>([BLjavassist/bytecode/ConstPool;Ljava/util/Map;)V
    .registers 4
    .param p1, "info"    # [B
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 423
    invoke-direct {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;-><init>([B)V

    .line 424
    iput-object p2, p0, Ljavassist/bytecode/AnnotationsAttribute$Renamer;->cpool:Ljavassist/bytecode/ConstPool;

    .line 425
    iput-object p3, p0, Ljavassist/bytecode/AnnotationsAttribute$Renamer;->classnames:Ljava/util/Map;

    .line 426
    return-void
.end method

.method private renameType(II)V
    .registers 7
    .param p1, "pos"    # I
    .param p2, "index"    # I

    .prologue
    .line 446
    iget-object v3, p0, Ljavassist/bytecode/AnnotationsAttribute$Renamer;->cpool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v3, p2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v1

    .line 447
    .local v1, "name":Ljava/lang/String;
    iget-object v3, p0, Ljavassist/bytecode/AnnotationsAttribute$Renamer;->classnames:Ljava/util/Map;

    invoke-static {v1, v3}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    .line 448
    .local v2, "newName":Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1d

    .line 449
    iget-object v3, p0, Ljavassist/bytecode/AnnotationsAttribute$Renamer;->cpool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v3, v2}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    .line 450
    .local v0, "index2":I
    iget-object v3, p0, Ljavassist/bytecode/AnnotationsAttribute$Renamer;->info:[B

    invoke-static {v0, v3, p1}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 452
    .end local v0    # "index2":I
    :cond_1d
    return-void
.end method


# virtual methods
.method annotation(III)I
    .registers 5
    .param p1, "pos"    # I
    .param p2, "type"    # I
    .param p3, "numPairs"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 429
    add-int/lit8 v0, p1, -0x4

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/AnnotationsAttribute$Renamer;->renameType(II)V

    .line 430
    invoke-super {p0, p1, p2, p3}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotation(III)I

    move-result v0

    return v0
.end method

.method classMemberValue(II)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 441
    add-int/lit8 v0, p1, 0x1

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/AnnotationsAttribute$Renamer;->renameType(II)V

    .line 442
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->classMemberValue(II)V

    .line 443
    return-void
.end method

.method enumMemberValue(III)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "typeNameIndex"    # I
    .param p3, "constNameIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 436
    add-int/lit8 v0, p1, 0x1

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/AnnotationsAttribute$Renamer;->renameType(II)V

    .line 437
    invoke-super {p0, p1, p2, p3}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->enumMemberValue(III)V

    .line 438
    return-void
.end method
