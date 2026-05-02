.class Ljavassist/bytecode/AnnotationsAttribute$Walker;
.super Ljava/lang/Object;
.source "AnnotationsAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/AnnotationsAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Walker"
.end annotation


# instance fields
.field info:[B


# direct methods
.method constructor <init>([B)V
    .registers 2
    .param p1, "attrInfo"    # [B

    .prologue
    .line 310
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 311
    iput-object p1, p0, Ljavassist/bytecode/AnnotationsAttribute$Walker;->info:[B

    .line 312
    return-void
.end method


# virtual methods
.method final annotation(I)I
    .registers 6
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 341
    iget-object v2, p0, Ljavassist/bytecode/AnnotationsAttribute$Walker;->info:[B

    invoke-static {v2, p1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v1

    .line 342
    .local v1, "type":I
    iget-object v2, p0, Ljavassist/bytecode/AnnotationsAttribute$Walker;->info:[B

    add-int/lit8 v3, p1, 0x2

    invoke-static {v2, v3}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    .line 343
    .local v0, "numPairs":I
    add-int/lit8 v2, p1, 0x4

    invoke-virtual {p0, v2, v1, v0}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotation(III)I

    move-result v2

    return v2
.end method

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
    .line 347
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_1
    if-ge v0, p3, :cond_a

    .line 348
    invoke-virtual {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->memberValuePair(I)I

    move-result p1

    .line 347
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 350
    :cond_a
    return p1
.end method

.method final annotationArray(I)I
    .registers 4
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 329
    iget-object v1, p0, Ljavassist/bytecode/AnnotationsAttribute$Walker;->info:[B

    invoke-static {v1, p1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    .line 330
    .local v0, "num":I
    add-int/lit8 v1, p1, 0x2

    invoke-virtual {p0, v1, v0}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotationArray(II)I

    move-result v1

    return v1
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
    .line 334
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p2, :cond_a

    .line 335
    invoke-virtual {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotation(I)I

    move-result p1

    .line 334
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 337
    :cond_a
    return p1
.end method

.method final annotationArray()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 325
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotationArray(I)I

    .line 326
    return-void
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
    .line 397
    invoke-virtual {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotation(I)I

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
    .line 401
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p2, :cond_a

    .line 402
    invoke-virtual {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->memberValue(I)I

    move-result p1

    .line 401
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 405
    :cond_a
    return p1
.end method

.method classMemberValue(II)V
    .registers 3
    .param p1, "pos"    # I
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 394
    return-void
.end method

.method constValueMember(II)V
    .registers 3
    .param p1, "tag"    # I
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 388
    return-void
.end method

.method enumMemberValue(III)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "typeNameIndex"    # I
    .param p3, "constNameIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 392
    return-void
.end method

.method final memberValue(I)I
    .registers 9
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 363
    iget-object v5, p0, Ljavassist/bytecode/AnnotationsAttribute$Walker;->info:[B

    aget-byte v5, v5, p1

    and-int/lit16 v3, v5, 0xff

    .line 364
    .local v3, "tag":I
    const/16 v5, 0x65

    if-ne v3, v5, :cond_20

    .line 365
    iget-object v5, p0, Ljavassist/bytecode/AnnotationsAttribute$Walker;->info:[B

    add-int/lit8 v6, p1, 0x1

    invoke-static {v5, v6}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v4

    .line 366
    .local v4, "typeNameIndex":I
    iget-object v5, p0, Ljavassist/bytecode/AnnotationsAttribute$Walker;->info:[B

    add-int/lit8 v6, p1, 0x3

    invoke-static {v5, v6}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    .line 367
    .local v0, "constNameIndex":I
    invoke-virtual {p0, p1, v4, v0}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->enumMemberValue(III)V

    .line 368
    add-int/lit8 v5, p1, 0x5

    .line 384
    .end local v0    # "constNameIndex":I
    .end local v4    # "typeNameIndex":I
    :goto_1f
    return v5

    .line 370
    :cond_20
    const/16 v5, 0x63

    if-ne v3, v5, :cond_32

    .line 371
    iget-object v5, p0, Ljavassist/bytecode/AnnotationsAttribute$Walker;->info:[B

    add-int/lit8 v6, p1, 0x1

    invoke-static {v5, v6}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v1

    .line 372
    .local v1, "index":I
    invoke-virtual {p0, p1, v1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->classMemberValue(II)V

    .line 373
    add-int/lit8 v5, p1, 0x3

    goto :goto_1f

    .line 375
    .end local v1    # "index":I
    :cond_32
    const/16 v5, 0x40

    if-ne v3, v5, :cond_3d

    .line 376
    add-int/lit8 v5, p1, 0x1

    invoke-virtual {p0, v5}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotationMemberValue(I)I

    move-result v5

    goto :goto_1f

    .line 377
    :cond_3d
    const/16 v5, 0x5b

    if-ne v3, v5, :cond_50

    .line 378
    iget-object v5, p0, Ljavassist/bytecode/AnnotationsAttribute$Walker;->info:[B

    add-int/lit8 v6, p1, 0x1

    invoke-static {v5, v6}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v2

    .line 379
    .local v2, "num":I
    add-int/lit8 v5, p1, 0x3

    invoke-virtual {p0, v5, v2}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->arrayMemberValue(II)I

    move-result v5

    goto :goto_1f

    .line 382
    .end local v2    # "num":I
    :cond_50
    iget-object v5, p0, Ljavassist/bytecode/AnnotationsAttribute$Walker;->info:[B

    add-int/lit8 v6, p1, 0x1

    invoke-static {v5, v6}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v1

    .line 383
    .restart local v1    # "index":I
    invoke-virtual {p0, v3, v1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->constValueMember(II)V

    .line 384
    add-int/lit8 v5, p1, 0x3

    goto :goto_1f
.end method

.method final memberValuePair(I)I
    .registers 4
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 354
    iget-object v1, p0, Ljavassist/bytecode/AnnotationsAttribute$Walker;->info:[B

    invoke-static {v1, p1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    .line 355
    .local v0, "nameIndex":I
    add-int/lit8 v1, p1, 0x2

    invoke-virtual {p0, v1, v0}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->memberValuePair(II)I

    move-result v1

    return v1
.end method

.method memberValuePair(II)I
    .registers 4
    .param p1, "pos"    # I
    .param p2, "nameIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 359
    invoke-virtual {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->memberValue(I)I

    move-result v0

    return v0
.end method

.method final parameters()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 315
    iget-object v1, p0, Ljavassist/bytecode/AnnotationsAttribute$Walker;->info:[B

    const/4 v2, 0x0

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 316
    .local v0, "numParam":I
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->parameters(II)V

    .line 317
    return-void
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
    .line 320
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p1, :cond_a

    .line 321
    invoke-virtual {p0, p2}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotationArray(I)I

    move-result p2

    .line 320
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 322
    :cond_a
    return-void
.end method
