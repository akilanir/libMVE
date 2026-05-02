.class Ljavassist/bytecode/AnnotationsAttribute$Copier;
.super Ljavassist/bytecode/AnnotationsAttribute$Walker;
.source "AnnotationsAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/AnnotationsAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Copier"
.end annotation


# instance fields
.field classnames:Ljava/util/Map;

.field destPool:Ljavassist/bytecode/ConstPool;

.field output:Ljava/io/ByteArrayOutputStream;

.field srcPool:Ljavassist/bytecode/ConstPool;

.field writer:Ljavassist/bytecode/annotation/AnnotationsWriter;


# direct methods
.method constructor <init>([BLjavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)V
    .registers 7
    .param p1, "info"    # [B
    .param p2, "src"    # Ljavassist/bytecode/ConstPool;
    .param p3, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p4, "map"    # Ljava/util/Map;

    .prologue
    .line 473
    invoke-direct {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;-><init>([B)V

    .line 474
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->output:Ljava/io/ByteArrayOutputStream;

    .line 475
    new-instance v0, Ljavassist/bytecode/annotation/AnnotationsWriter;

    iget-object v1, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->output:Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, v1, p3}, Ljavassist/bytecode/annotation/AnnotationsWriter;-><init>(Ljava/io/OutputStream;Ljavassist/bytecode/ConstPool;)V

    iput-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->writer:Ljavassist/bytecode/annotation/AnnotationsWriter;

    .line 476
    iput-object p2, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->srcPool:Ljavassist/bytecode/ConstPool;

    .line 477
    iput-object p3, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->destPool:Ljavassist/bytecode/ConstPool;

    .line 478
    iput-object p4, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->classnames:Ljava/util/Map;

    .line 479
    return-void
.end method


# virtual methods
.method annotation(III)I
    .registers 6
    .param p1, "pos"    # I
    .param p2, "type"    # I
    .param p3, "numPairs"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 497
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->writer:Ljavassist/bytecode/annotation/AnnotationsWriter;

    invoke-virtual {p0, p2}, Ljavassist/bytecode/AnnotationsAttribute$Copier;->copyType(I)I

    move-result v1

    invoke-virtual {v0, v1, p3}, Ljavassist/bytecode/annotation/AnnotationsWriter;->annotation(II)V

    .line 498
    invoke-super {p0, p1, p2, p3}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotation(III)I

    move-result v0

    return v0
.end method

.method annotationArray(II)I
    .registers 4
    .param p1, "pos"    # I
    .param p2, "num"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 492
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->writer:Ljavassist/bytecode/annotation/AnnotationsWriter;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/annotation/AnnotationsWriter;->numAnnotations(I)V

    .line 493
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotationArray(II)I

    move-result v0

    return v0
.end method

.method annotationMemberValue(I)I
    .registers 3
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 524
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->writer:Ljavassist/bytecode/annotation/AnnotationsWriter;

    invoke-virtual {v0}, Ljavassist/bytecode/annotation/AnnotationsWriter;->annotationValue()V

    .line 525
    invoke-super {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotationMemberValue(I)I

    move-result v0

    return v0
.end method

.method arrayMemberValue(II)I
    .registers 4
    .param p1, "pos"    # I
    .param p2, "num"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 529
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->writer:Ljavassist/bytecode/annotation/AnnotationsWriter;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/annotation/AnnotationsWriter;->arrayValue(I)V

    .line 530
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->arrayMemberValue(II)I

    move-result v0

    return v0
.end method

.method classMemberValue(II)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 519
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->writer:Ljavassist/bytecode/annotation/AnnotationsWriter;

    invoke-virtual {p0, p2}, Ljavassist/bytecode/AnnotationsAttribute$Copier;->copyType(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->classInfoIndex(I)V

    .line 520
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->classMemberValue(II)V

    .line 521
    return-void
.end method

.method close()[B
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 482
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->writer:Ljavassist/bytecode/annotation/AnnotationsWriter;

    invoke-virtual {v0}, Ljavassist/bytecode/annotation/AnnotationsWriter;->close()V

    .line 483
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->output:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method constValueMember(II)V
    .registers 5
    .param p1, "tag"    # I
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 507
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->writer:Ljavassist/bytecode/annotation/AnnotationsWriter;

    invoke-virtual {p0, p2}, Ljavassist/bytecode/AnnotationsAttribute$Copier;->copy(I)I

    move-result v1

    invoke-virtual {v0, p1, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(II)V

    .line 508
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->constValueMember(II)V

    .line 509
    return-void
.end method

.method copy(I)I
    .registers 5
    .param p1, "srcIndex"    # I

    .prologue
    .line 543
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->srcPool:Ljavassist/bytecode/ConstPool;

    iget-object v1, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->destPool:Ljavassist/bytecode/ConstPool;

    iget-object v2, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->classnames:Ljava/util/Map;

    invoke-virtual {v0, p1, v1, v2}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v0

    return v0
.end method

.method copyType(I)I
    .registers 5
    .param p1, "srcIndex"    # I

    .prologue
    .line 557
    iget-object v2, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->srcPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v2, p1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    .line 558
    .local v0, "name":Ljava/lang/String;
    iget-object v2, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->classnames:Ljava/util/Map;

    invoke-static {v0, v2}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 559
    .local v1, "newName":Ljava/lang/String;
    iget-object v2, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->destPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    return v2
.end method

.method enumMemberValue(III)V
    .registers 7
    .param p1, "pos"    # I
    .param p2, "typeNameIndex"    # I
    .param p3, "constNameIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 514
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->writer:Ljavassist/bytecode/annotation/AnnotationsWriter;

    invoke-virtual {p0, p2}, Ljavassist/bytecode/AnnotationsAttribute$Copier;->copyType(I)I

    move-result v1

    invoke-virtual {p0, p3}, Ljavassist/bytecode/AnnotationsAttribute$Copier;->copy(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljavassist/bytecode/annotation/AnnotationsWriter;->enumConstValue(II)V

    .line 515
    invoke-super {p0, p1, p2, p3}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->enumMemberValue(III)V

    .line 516
    return-void
.end method

.method memberValuePair(II)I
    .registers 5
    .param p1, "pos"    # I
    .param p2, "nameIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 502
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->writer:Ljavassist/bytecode/annotation/AnnotationsWriter;

    invoke-virtual {p0, p2}, Ljavassist/bytecode/AnnotationsAttribute$Copier;->copy(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->memberValuePair(I)V

    .line 503
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->memberValuePair(II)I

    move-result v0

    return v0
.end method

.method parameters(II)V
    .registers 4
    .param p1, "numParam"    # I
    .param p2, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 487
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Copier;->writer:Ljavassist/bytecode/annotation/AnnotationsWriter;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->numParameters(I)V

    .line 488
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->parameters(II)V

    .line 489
    return-void
.end method
