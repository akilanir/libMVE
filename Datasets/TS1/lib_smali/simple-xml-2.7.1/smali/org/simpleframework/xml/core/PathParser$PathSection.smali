.class Lorg/simpleframework/xml/core/PathParser$PathSection;
.super Ljava/lang/Object;
.source "PathParser.java"

# interfaces
.implements Lorg/simpleframework/xml/core/Expression;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/simpleframework/xml/core/PathParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PathSection"
.end annotation


# instance fields
.field private begin:I

.field private cache:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private end:I

.field private path:Ljava/lang/String;

.field private section:Ljava/lang/String;

.field final synthetic this$0:Lorg/simpleframework/xml/core/PathParser;


# direct methods
.method public constructor <init>(Lorg/simpleframework/xml/core/PathParser;II)V
    .registers 5
    .param p2, "index"    # I
    .param p3, "end"    # I

    .prologue
    .line 816
    iput-object p1, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 817
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->cache:Ljava/util/List;

    .line 818
    iput p2, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->begin:I

    .line 819
    iput p3, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->end:I

    .line 820
    return-void
.end method

.method private getCanonicalPath()Ljava/lang/String;
    .registers 7

    .prologue
    const/16 v5, 0x2f

    .line 1021
    const/4 v2, 0x0

    .line 1022
    .local v2, "start":I
    const/4 v0, 0x0

    .line 1023
    .local v0, "last":I
    const/4 v1, 0x0

    .line 1025
    .local v1, "pos":I
    const/4 v1, 0x0

    :goto_6
    iget v3, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->begin:I

    if-ge v1, v3, :cond_17

    .line 1026
    iget-object v3, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-object v3, v3, Lorg/simpleframework/xml/core/PathParser;->location:Ljava/lang/String;

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 1025
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 1028
    :cond_17
    move v0, v2

    :goto_18
    iget v3, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->end:I

    if-gt v1, v3, :cond_34

    .line 1029
    iget-object v3, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-object v3, v3, Lorg/simpleframework/xml/core/PathParser;->location:Ljava/lang/String;

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 1030
    const/4 v3, -0x1

    if-ne v0, v3, :cond_31

    .line 1031
    iget-object v3, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-object v3, v3, Lorg/simpleframework/xml/core/PathParser;->location:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    .line 1028
    :cond_31
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 1034
    :cond_34
    iget-object v3, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-object v3, v3, Lorg/simpleframework/xml/core/PathParser;->location:Ljava/lang/String;

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v3, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private getFragment()Ljava/lang/String;
    .registers 8

    .prologue
    .line 1045
    iget-object v4, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget v1, v4, Lorg/simpleframework/xml/core/PathParser;->start:I

    .line 1046
    .local v1, "last":I
    const/4 v3, 0x0

    .line 1048
    .local v3, "pos":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget v4, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->end:I

    if-gt v0, v4, :cond_12

    .line 1049
    iget-object v4, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget v4, v4, Lorg/simpleframework/xml/core/PathParser;->count:I

    if-lt v1, v4, :cond_20

    .line 1050
    add-int/lit8 v1, v1, 0x1

    .line 1059
    :cond_12
    new-instance v4, Ljava/lang/String;

    iget-object v5, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-object v5, v5, Lorg/simpleframework/xml/core/PathParser;->data:[C

    add-int/lit8 v1, v1, -0x1

    sub-int v6, v1, v3

    invoke-direct {v4, v5, v3, v6}, Ljava/lang/String;-><init>([CII)V

    return-object v4

    .line 1053
    :cond_20
    iget-object v4, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-object v4, v4, Lorg/simpleframework/xml/core/PathParser;->data:[C

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "last":I
    .local v2, "last":I
    aget-char v4, v4, v1

    const/16 v5, 0x2f

    if-ne v4, v5, :cond_35

    .line 1054
    add-int/lit8 v0, v0, 0x1

    iget v4, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->begin:I

    if-ne v0, v4, :cond_35

    .line 1055
    move v3, v2

    move v1, v2

    .end local v2    # "last":I
    .restart local v1    # "last":I
    goto :goto_6

    .end local v1    # "last":I
    .restart local v2    # "last":I
    :cond_35
    move v1, v2

    .end local v2    # "last":I
    .restart local v1    # "last":I
    goto :goto_6
.end method


# virtual methods
.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 904
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/PathParser$PathSection;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 906
    .local v0, "path":Ljava/lang/String;
    if-eqz v0, :cond_c

    .line 907
    iget-object v1, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    invoke-virtual {v1, v0, p1}, Lorg/simpleframework/xml/core/PathParser;->getAttributePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 909
    .end local p1    # "name":Ljava/lang/String;
    :cond_c
    return-object p1
.end method

.method public getElement(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 885
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/PathParser$PathSection;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 887
    .local v0, "path":Ljava/lang/String;
    if-eqz v0, :cond_c

    .line 888
    iget-object v1, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    invoke-virtual {v1, v0, p1}, Lorg/simpleframework/xml/core/PathParser;->getElementPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 890
    .end local p1    # "name":Ljava/lang/String;
    :cond_c
    return-object p1
.end method

.method public getFirst()Ljava/lang/String;
    .registers 3

    .prologue
    .line 945
    iget-object v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-object v0, v0, Lorg/simpleframework/xml/core/PathParser;->names:Ljava/util/List;

    iget v1, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->begin:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getIndex()I
    .registers 3

    .prologue
    .line 921
    iget-object v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-object v0, v0, Lorg/simpleframework/xml/core/PathParser;->indexes:Ljava/util/List;

    iget v1, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->begin:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getLast()Ljava/lang/String;
    .registers 3

    .prologue
    .line 957
    iget-object v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-object v0, v0, Lorg/simpleframework/xml/core/PathParser;->names:Ljava/util/List;

    iget v1, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->end:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 868
    iget-object v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->section:Ljava/lang/String;

    if-nez v0, :cond_a

    .line 869
    invoke-direct {p0}, Lorg/simpleframework/xml/core/PathParser$PathSection;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->section:Ljava/lang/String;

    .line 871
    :cond_a
    iget-object v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->section:Ljava/lang/String;

    return-object v0
.end method

.method public getPath(I)Lorg/simpleframework/xml/core/Expression;
    .registers 3
    .param p1, "from"    # I

    .prologue
    .line 972
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/simpleframework/xml/core/PathParser$PathSection;->getPath(II)Lorg/simpleframework/xml/core/Expression;

    move-result-object v0

    return-object v0
.end method

.method public getPath(II)Lorg/simpleframework/xml/core/Expression;
    .registers 7
    .param p1, "from"    # I
    .param p2, "trim"    # I

    .prologue
    .line 988
    new-instance v0, Lorg/simpleframework/xml/core/PathParser$PathSection;

    iget-object v1, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget v2, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->begin:I

    add-int/2addr v2, p1

    iget v3, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->end:I

    sub-int/2addr v3, p2

    invoke-direct {v0, v1, v2, v3}, Lorg/simpleframework/xml/core/PathParser$PathSection;-><init>(Lorg/simpleframework/xml/core/PathParser;II)V

    return-object v0
.end method

.method public getPrefix()Ljava/lang/String;
    .registers 3

    .prologue
    .line 933
    iget-object v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-object v0, v0, Lorg/simpleframework/xml/core/PathParser;->prefixes:Ljava/util/List;

    iget v1, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->begin:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public isAttribute()Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 853
    iget-object v1, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-boolean v1, v1, Lorg/simpleframework/xml/core/PathParser;->attribute:Z

    if-eqz v1, :cond_16

    .line 854
    iget v1, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->end:I

    iget-object v2, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-object v2, v2, Lorg/simpleframework/xml/core/PathParser;->names:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-lt v1, v2, :cond_16

    const/4 v0, 0x1

    .line 856
    :cond_16
    return v0
.end method

.method public isEmpty()Z
    .registers 3

    .prologue
    .line 830
    iget v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->begin:I

    iget v1, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->end:I

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isPath()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 841
    iget v1, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->end:I

    iget v2, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->begin:I

    sub-int/2addr v1, v2

    if-lt v1, v0, :cond_9

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1000
    iget-object v2, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->cache:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 1001
    iget v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->begin:I

    .local v0, "i":I
    :goto_a
    iget v2, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->end:I

    if-gt v0, v2, :cond_22

    .line 1002
    iget-object v2, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->this$0:Lorg/simpleframework/xml/core/PathParser;

    iget-object v2, v2, Lorg/simpleframework/xml/core/PathParser;->names:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1004
    .local v1, "segment":Ljava/lang/String;
    if-eqz v1, :cond_1f

    .line 1005
    iget-object v2, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->cache:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1001
    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1009
    .end local v0    # "i":I
    .end local v1    # "segment":Ljava/lang/String;
    :cond_22
    iget-object v2, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->cache:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1070
    iget-object v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->path:Ljava/lang/String;

    if-nez v0, :cond_a

    .line 1071
    invoke-direct {p0}, Lorg/simpleframework/xml/core/PathParser$PathSection;->getFragment()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->path:Ljava/lang/String;

    .line 1073
    :cond_a
    iget-object v0, p0, Lorg/simpleframework/xml/core/PathParser$PathSection;->path:Ljava/lang/String;

    return-object v0
.end method
