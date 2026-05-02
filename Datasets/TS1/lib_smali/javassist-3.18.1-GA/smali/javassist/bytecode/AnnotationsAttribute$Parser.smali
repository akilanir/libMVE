.class Ljavassist/bytecode/AnnotationsAttribute$Parser;
.super Ljavassist/bytecode/AnnotationsAttribute$Walker;
.source "AnnotationsAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/AnnotationsAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Parser"
.end annotation


# instance fields
.field allAnno:[Ljavassist/bytecode/annotation/Annotation;

.field allParams:[[Ljavassist/bytecode/annotation/Annotation;

.field currentAnno:Ljavassist/bytecode/annotation/Annotation;

.field currentMember:Ljavassist/bytecode/annotation/MemberValue;

.field pool:Ljavassist/bytecode/ConstPool;


# direct methods
.method constructor <init>([BLjavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "info"    # [B
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 578
    invoke-direct {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;-><init>([B)V

    .line 579
    iput-object p2, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->pool:Ljavassist/bytecode/ConstPool;

    .line 580
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
    .line 619
    new-instance v0, Ljavassist/bytecode/annotation/Annotation;

    iget-object v1, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->pool:Ljavassist/bytecode/ConstPool;

    invoke-direct {v0, p2, v1}, Ljavassist/bytecode/annotation/Annotation;-><init>(ILjavassist/bytecode/ConstPool;)V

    iput-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentAnno:Ljavassist/bytecode/annotation/Annotation;

    .line 620
    invoke-super {p0, p1, p2, p3}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotation(III)I

    move-result v0

    return v0
.end method

.method annotationArray(II)I
    .registers 6
    .param p1, "pos"    # I
    .param p2, "num"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 608
    new-array v0, p2, [Ljavassist/bytecode/annotation/Annotation;

    .line 609
    .local v0, "array":[Ljavassist/bytecode/annotation/Annotation;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    if-ge v1, p2, :cond_10

    .line 610
    invoke-virtual {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute$Parser;->annotation(I)I

    move-result p1

    .line 611
    iget-object v2, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentAnno:Ljavassist/bytecode/annotation/Annotation;

    aput-object v2, v0, v1

    .line 609
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 614
    :cond_10
    iput-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->allAnno:[Ljavassist/bytecode/annotation/Annotation;

    .line 615
    return p1
.end method

.method annotationMemberValue(I)I
    .registers 6
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 682
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentAnno:Ljavassist/bytecode/annotation/Annotation;

    .line 683
    .local v0, "anno":Ljavassist/bytecode/annotation/Annotation;
    invoke-super {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->annotationMemberValue(I)I

    move-result p1

    .line 684
    new-instance v1, Ljavassist/bytecode/annotation/AnnotationMemberValue;

    iget-object v2, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentAnno:Ljavassist/bytecode/annotation/Annotation;

    iget-object v3, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->pool:Ljavassist/bytecode/ConstPool;

    invoke-direct {v1, v2, v3}, Ljavassist/bytecode/annotation/AnnotationMemberValue;-><init>(Ljavassist/bytecode/annotation/Annotation;Ljavassist/bytecode/ConstPool;)V

    iput-object v1, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentMember:Ljavassist/bytecode/annotation/MemberValue;

    .line 685
    iput-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentAnno:Ljavassist/bytecode/annotation/Annotation;

    .line 686
    return p1
.end method

.method arrayMemberValue(II)I
    .registers 7
    .param p1, "pos"    # I
    .param p2, "num"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 690
    new-instance v0, Ljavassist/bytecode/annotation/ArrayMemberValue;

    iget-object v3, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->pool:Ljavassist/bytecode/ConstPool;

    invoke-direct {v0, v3}, Ljavassist/bytecode/annotation/ArrayMemberValue;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 691
    .local v0, "amv":Ljavassist/bytecode/annotation/ArrayMemberValue;
    new-array v1, p2, [Ljavassist/bytecode/annotation/MemberValue;

    .line 692
    .local v1, "elements":[Ljavassist/bytecode/annotation/MemberValue;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    if-ge v2, p2, :cond_17

    .line 693
    invoke-virtual {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute$Parser;->memberValue(I)I

    move-result p1

    .line 694
    iget-object v3, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentMember:Ljavassist/bytecode/annotation/MemberValue;

    aput-object v3, v1, v2

    .line 692
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 697
    :cond_17
    invoke-virtual {v0, v1}, Ljavassist/bytecode/annotation/ArrayMemberValue;->setValue([Ljavassist/bytecode/annotation/MemberValue;)V

    .line 698
    iput-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentMember:Ljavassist/bytecode/annotation/MemberValue;

    .line 699
    return p1
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
    .line 677
    new-instance v0, Ljavassist/bytecode/annotation/ClassMemberValue;

    iget-object v1, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->pool:Ljavassist/bytecode/ConstPool;

    invoke-direct {v0, p2, v1}, Ljavassist/bytecode/annotation/ClassMemberValue;-><init>(ILjavassist/bytecode/ConstPool;)V

    iput-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentMember:Ljavassist/bytecode/annotation/MemberValue;

    .line 678
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->classMemberValue(II)V

    .line 679
    return-void
.end method

.method constValueMember(II)V
    .registers 8
    .param p1, "tag"    # I
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 631
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->pool:Ljavassist/bytecode/ConstPool;

    .line 632
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    sparse-switch p1, :sswitch_data_5a

    .line 661
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unknown tag:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 634
    :sswitch_1e
    new-instance v1, Ljavassist/bytecode/annotation/ByteMemberValue;

    invoke-direct {v1, p2, v0}, Ljavassist/bytecode/annotation/ByteMemberValue;-><init>(ILjavassist/bytecode/ConstPool;)V

    .line 664
    .local v1, "m":Ljavassist/bytecode/annotation/MemberValue;
    :goto_23
    iput-object v1, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentMember:Ljavassist/bytecode/annotation/MemberValue;

    .line 665
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->constValueMember(II)V

    .line 666
    return-void

    .line 637
    .end local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    :sswitch_29
    new-instance v1, Ljavassist/bytecode/annotation/CharMemberValue;

    invoke-direct {v1, p2, v0}, Ljavassist/bytecode/annotation/CharMemberValue;-><init>(ILjavassist/bytecode/ConstPool;)V

    .line 638
    .restart local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    goto :goto_23

    .line 640
    .end local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    :sswitch_2f
    new-instance v1, Ljavassist/bytecode/annotation/DoubleMemberValue;

    invoke-direct {v1, p2, v0}, Ljavassist/bytecode/annotation/DoubleMemberValue;-><init>(ILjavassist/bytecode/ConstPool;)V

    .line 641
    .restart local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    goto :goto_23

    .line 643
    .end local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    :sswitch_35
    new-instance v1, Ljavassist/bytecode/annotation/FloatMemberValue;

    invoke-direct {v1, p2, v0}, Ljavassist/bytecode/annotation/FloatMemberValue;-><init>(ILjavassist/bytecode/ConstPool;)V

    .line 644
    .restart local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    goto :goto_23

    .line 646
    .end local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    :sswitch_3b
    new-instance v1, Ljavassist/bytecode/annotation/IntegerMemberValue;

    invoke-direct {v1, p2, v0}, Ljavassist/bytecode/annotation/IntegerMemberValue;-><init>(ILjavassist/bytecode/ConstPool;)V

    .line 647
    .restart local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    goto :goto_23

    .line 649
    .end local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    :sswitch_41
    new-instance v1, Ljavassist/bytecode/annotation/LongMemberValue;

    invoke-direct {v1, p2, v0}, Ljavassist/bytecode/annotation/LongMemberValue;-><init>(ILjavassist/bytecode/ConstPool;)V

    .line 650
    .restart local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    goto :goto_23

    .line 652
    .end local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    :sswitch_47
    new-instance v1, Ljavassist/bytecode/annotation/ShortMemberValue;

    invoke-direct {v1, p2, v0}, Ljavassist/bytecode/annotation/ShortMemberValue;-><init>(ILjavassist/bytecode/ConstPool;)V

    .line 653
    .restart local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    goto :goto_23

    .line 655
    .end local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    :sswitch_4d
    new-instance v1, Ljavassist/bytecode/annotation/BooleanMemberValue;

    invoke-direct {v1, p2, v0}, Ljavassist/bytecode/annotation/BooleanMemberValue;-><init>(ILjavassist/bytecode/ConstPool;)V

    .line 656
    .restart local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    goto :goto_23

    .line 658
    .end local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    :sswitch_53
    new-instance v1, Ljavassist/bytecode/annotation/StringMemberValue;

    invoke-direct {v1, p2, v0}, Ljavassist/bytecode/annotation/StringMemberValue;-><init>(ILjavassist/bytecode/ConstPool;)V

    .line 659
    .restart local v1    # "m":Ljavassist/bytecode/annotation/MemberValue;
    goto :goto_23

    .line 632
    nop

    :sswitch_data_5a
    .sparse-switch
        0x42 -> :sswitch_1e
        0x43 -> :sswitch_29
        0x44 -> :sswitch_2f
        0x46 -> :sswitch_35
        0x49 -> :sswitch_3b
        0x4a -> :sswitch_41
        0x53 -> :sswitch_47
        0x5a -> :sswitch_4d
        0x73 -> :sswitch_53
    .end sparse-switch
.end method

.method enumMemberValue(III)V
    .registers 6
    .param p1, "pos"    # I
    .param p2, "typeNameIndex"    # I
    .param p3, "constNameIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 671
    new-instance v0, Ljavassist/bytecode/annotation/EnumMemberValue;

    iget-object v1, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->pool:Ljavassist/bytecode/ConstPool;

    invoke-direct {v0, p2, p3, v1}, Ljavassist/bytecode/annotation/EnumMemberValue;-><init>(IILjavassist/bytecode/ConstPool;)V

    iput-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentMember:Ljavassist/bytecode/annotation/MemberValue;

    .line 673
    invoke-super {p0, p1, p2, p3}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->enumMemberValue(III)V

    .line 674
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
    .line 624
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/AnnotationsAttribute$Walker;->memberValuePair(II)I

    move-result p1

    .line 625
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentAnno:Ljavassist/bytecode/annotation/Annotation;

    iget-object v1, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentMember:Ljavassist/bytecode/annotation/MemberValue;

    invoke-virtual {v0, p2, v1}, Ljavassist/bytecode/annotation/Annotation;->addMemberValue(ILjavassist/bytecode/annotation/MemberValue;)V

    .line 626
    return p1
.end method

.method parameters(II)V
    .registers 6
    .param p1, "numParam"    # I
    .param p2, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 598
    new-array v1, p1, [[Ljavassist/bytecode/annotation/Annotation;

    .line 599
    .local v1, "params":[[Ljavassist/bytecode/annotation/Annotation;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    if-ge v0, p1, :cond_10

    .line 600
    invoke-virtual {p0, p2}, Ljavassist/bytecode/AnnotationsAttribute$Parser;->annotationArray(I)I

    move-result p2

    .line 601
    iget-object v2, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->allAnno:[Ljavassist/bytecode/annotation/Annotation;

    aput-object v2, v1, v0

    .line 599
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 604
    :cond_10
    iput-object v1, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->allParams:[[Ljavassist/bytecode/annotation/Annotation;

    .line 605
    return-void
.end method

.method parseAnnotations()[Ljavassist/bytecode/annotation/Annotation;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 588
    invoke-virtual {p0}, Ljavassist/bytecode/AnnotationsAttribute$Parser;->annotationArray()V

    .line 589
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->allAnno:[Ljavassist/bytecode/annotation/Annotation;

    return-object v0
.end method

.method parseMemberValue()Ljavassist/bytecode/annotation/MemberValue;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 593
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/AnnotationsAttribute$Parser;->memberValue(I)I

    .line 594
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->currentMember:Ljavassist/bytecode/annotation/MemberValue;

    return-object v0
.end method

.method parseParameters()[[Ljavassist/bytecode/annotation/Annotation;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 583
    invoke-virtual {p0}, Ljavassist/bytecode/AnnotationsAttribute$Parser;->parameters()V

    .line 584
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute$Parser;->allParams:[[Ljavassist/bytecode/annotation/Annotation;

    return-object v0
.end method
