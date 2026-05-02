.class Lcom/adobe/xmp/impl/XMPNode;
.super Ljava/lang/Object;
.source "XMPNode.java"

# interfaces
.implements Ljava/lang/Comparable;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private alias:Z

.field private children:Ljava/util/List;

.field private hasAliases:Z

.field private hasValueChild:Z

.field private implicit:Z

.field private name:Ljava/lang/String;

.field private options:Lcom/adobe/xmp/options/PropertyOptions;

.field private parent:Lcom/adobe/xmp/impl/XMPNode;

.field private qualifier:Ljava/util/List;

.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 38
    const-class v0, Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/adobe/xmp/impl/XMPNode;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "options"    # Lcom/adobe/xmp/options/PropertyOptions;

    .prologue
    .line 89
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 90
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "options"    # Lcom/adobe/xmp/options/PropertyOptions;

    .prologue
    const/4 v0, 0x0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 49
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 51
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    .line 75
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 76
    iput-object p2, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 77
    iput-object p3, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    .line 78
    return-void
.end method

.method private assertChildNotExisting(Ljava/lang/String;)V
    .registers 5
    .param p1, "childName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 899
    const-string v0, "[]"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2f

    invoke-virtual {p0, p1}, Lcom/adobe/xmp/impl/XMPNode;->findChildByName(Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    if-eqz v0, :cond_2f

    .line 902
    new-instance v0, Lcom/adobe/xmp/XMPException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Duplicate property or field node \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 905
    :cond_2f
    return-void
.end method

.method private assertQualifierNotExisting(Ljava/lang/String;)V
    .registers 5
    .param p1, "qualifierName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 915
    const-string v0, "[]"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2f

    invoke-virtual {p0, p1}, Lcom/adobe/xmp/impl/XMPNode;->findQualifierByName(Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    if-eqz v0, :cond_2f

    .line 918
    new-instance v0, Lcom/adobe/xmp/XMPException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Duplicate \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' qualifier"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 920
    :cond_2f
    return-void
.end method

.method private dumpNode(Ljava/lang/StringBuffer;ZII)V
    .registers 13
    .param p1, "result"    # Ljava/lang/StringBuffer;
    .param p2, "recursive"    # Z
    .param p3, "indent"    # I
    .param p4, "index"    # I

    .prologue
    const/16 v7, 0x29

    .line 705
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    if-ge v2, p3, :cond_d

    .line 707
    const/16 v5, 0x9

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 705
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 711
    :cond_d
    iget-object v5, p0, Lcom/adobe/xmp/impl/XMPNode;->parent:Lcom/adobe/xmp/impl/XMPNode;

    if-eqz v5, :cond_d5

    .line 713
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/options/PropertyOptions;->isQualifier()Z

    move-result v5

    if-eqz v5, :cond_b1

    .line 715
    const/16 v5, 0x3f

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 716
    iget-object v5, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 742
    :cond_25
    :goto_25
    iget-object v5, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    if-eqz v5, :cond_40

    iget-object v5, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_40

    .line 744
    const-string v5, " = \""

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 745
    iget-object v5, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 746
    const/16 v5, 0x22

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 750
    :cond_40
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Lcom/adobe/xmp/options/PropertyOptions;->containsOneOf(I)Z

    move-result v5

    if-eqz v5, :cond_6e

    .line 752
    const-string v5, "\t("

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 753
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/options/PropertyOptions;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 754
    const-string v5, " : "

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 755
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/options/PropertyOptions;->getOptionsString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 756
    invoke-virtual {p1, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 759
    :cond_6e
    const/16 v5, 0xa

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 762
    if-eqz p2, :cond_109

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v5

    if-eqz v5, :cond_109

    .line 764
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v5

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifierLength()I

    move-result v6

    new-array v6, v6, [Lcom/adobe/xmp/impl/XMPNode;

    invoke-interface {v5, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/adobe/xmp/impl/XMPNode;

    move-object v4, v5

    check-cast v4, [Lcom/adobe/xmp/impl/XMPNode;

    .line 766
    .local v4, "quals":[Lcom/adobe/xmp/impl/XMPNode;
    const/4 v2, 0x0

    .line 767
    :goto_8f
    array-length v5, v4

    if-le v5, v2, :cond_f5

    const-string v5, "xml:lang"

    aget-object v6, v4, v2

    invoke-virtual {v6}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_ae

    const-string v5, "rdf:type"

    aget-object v6, v4, v2

    invoke-virtual {v6}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f5

    .line 772
    :cond_ae
    add-int/lit8 v2, v2, 0x1

    goto :goto_8f

    .line 718
    .end local v4    # "quals":[Lcom/adobe/xmp/impl/XMPNode;
    :cond_b1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getParent()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result v5

    if-eqz v5, :cond_ce

    .line 720
    const/16 v5, 0x5b

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 721
    invoke-virtual {p1, p4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 722
    const/16 v5, 0x5d

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_25

    .line 726
    :cond_ce
    iget-object v5, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_25

    .line 732
    :cond_d5
    const-string v5, "ROOT NODE"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 733
    iget-object v5, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    if-eqz v5, :cond_25

    iget-object v5, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_25

    .line 736
    const-string v5, " ("

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 737
    iget-object v5, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 738
    invoke-virtual {p1, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_25

    .line 774
    .restart local v4    # "quals":[Lcom/adobe/xmp/impl/XMPNode;
    :cond_f5
    array-length v5, v4

    invoke-static {v4, v2, v5}, Ljava/util/Arrays;->sort([Ljava/lang/Object;II)V

    .line 775
    const/4 v2, 0x0

    :goto_fa
    array-length v5, v4

    if-ge v2, v5, :cond_109

    .line 777
    aget-object v3, v4, v2

    .line 778
    .local v3, "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    add-int/lit8 v5, p3, 0x2

    add-int/lit8 v6, v2, 0x1

    invoke-direct {v3, p1, p2, v5, v6}, Lcom/adobe/xmp/impl/XMPNode;->dumpNode(Ljava/lang/StringBuffer;ZII)V

    .line 775
    add-int/lit8 v2, v2, 0x1

    goto :goto_fa

    .line 783
    .end local v3    # "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    .end local v4    # "quals":[Lcom/adobe/xmp/impl/XMPNode;
    :cond_109
    if-eqz p2, :cond_141

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v5

    if-eqz v5, :cond_141

    .line 785
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v5

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v6

    new-array v6, v6, [Lcom/adobe/xmp/impl/XMPNode;

    invoke-interface {v5, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/adobe/xmp/impl/XMPNode;

    move-object v1, v5

    check-cast v1, [Lcom/adobe/xmp/impl/XMPNode;

    .line 787
    .local v1, "children":[Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result v5

    if-nez v5, :cond_131

    .line 789
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 791
    :cond_131
    const/4 v2, 0x0

    :goto_132
    array-length v5, v1

    if-ge v2, v5, :cond_141

    .line 793
    aget-object v0, v1, v2

    .line 794
    .local v0, "child":Lcom/adobe/xmp/impl/XMPNode;
    add-int/lit8 v5, p3, 0x1

    add-int/lit8 v6, v2, 0x1

    invoke-direct {v0, p1, p2, v5, v6}, Lcom/adobe/xmp/impl/XMPNode;->dumpNode(Ljava/lang/StringBuffer;ZII)V

    .line 791
    add-int/lit8 v2, v2, 0x1

    goto :goto_132

    .line 797
    .end local v0    # "child":Lcom/adobe/xmp/impl/XMPNode;
    .end local v1    # "children":[Lcom/adobe/xmp/impl/XMPNode;
    :cond_141
    return-void
.end method

.method private find(Ljava/util/List;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;
    .registers 6
    .param p1, "list"    # Ljava/util/List;
    .param p2, "expr"    # Ljava/lang/String;

    .prologue
    .line 877
    if-eqz p1, :cond_1d

    .line 879
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 881
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    .line 882
    .local v0, "child":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 888
    .end local v0    # "child":Lcom/adobe/xmp/impl/XMPNode;
    .end local v1    # "it":Ljava/util/Iterator;
    :goto_1c
    return-object v0

    :cond_1d
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method private getChildren()Ljava/util/List;
    .registers 3

    .prologue
    .line 825
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    if-nez v0, :cond_c

    .line 827
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 829
    :cond_c
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    return-object v0
.end method

.method private getQualifier()Ljava/util/List;
    .registers 3

    .prologue
    .line 847
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    if-nez v0, :cond_c

    .line 849
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 851
    :cond_c
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    return-object v0
.end method

.method private isLanguageNode()Z
    .registers 3

    .prologue
    .line 805
    const-string v0, "xml:lang"

    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isTypeNode()Z
    .registers 3

    .prologue
    .line 814
    const-string v0, "rdf:type"

    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public addChild(ILcom/adobe/xmp/impl/XMPNode;)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "node"    # Lcom/adobe/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 149
    invoke-virtual {p2}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->assertChildNotExisting(Ljava/lang/String;)V

    .line 150
    invoke-virtual {p2, p0}, Lcom/adobe/xmp/impl/XMPNode;->setParent(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 151
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 152
    return-void
.end method

.method public addChild(Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 3
    .param p1, "node"    # Lcom/adobe/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 133
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->assertChildNotExisting(Ljava/lang/String;)V

    .line 134
    invoke-virtual {p1, p0}, Lcom/adobe/xmp/impl/XMPNode;->setParent(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 135
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    return-void
.end method

.method public addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 6
    .param p1, "qualNode"    # Lcom/adobe/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 264
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPNode;->assertQualifierNotExisting(Ljava/lang/String;)V

    .line 265
    invoke-virtual {p1, p0}, Lcom/adobe/xmp/impl/XMPNode;->setParent(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 266
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/adobe/xmp/options/PropertyOptions;->setQualifier(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 267
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/adobe/xmp/options/PropertyOptions;->setHasQualifiers(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 270
    invoke-direct {p1}, Lcom/adobe/xmp/impl/XMPNode;->isLanguageNode()Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 273
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    invoke-virtual {v2, v1}, Lcom/adobe/xmp/options/PropertyOptions;->setHasLanguage(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 274
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 289
    :goto_2c
    return-void

    .line 276
    :cond_2d
    invoke-direct {p1}, Lcom/adobe/xmp/impl/XMPNode;->isTypeNode()Z

    move-result v2

    if-eqz v2, :cond_4a

    .line 279
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    invoke-virtual {v2, v1}, Lcom/adobe/xmp/options/PropertyOptions;->setHasType(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 280
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    invoke-virtual {v3}, Lcom/adobe/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v3

    if-nez v3, :cond_48

    :goto_44
    invoke-interface {v2, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_2c

    :cond_48
    move v0, v1

    goto :goto_44

    .line 287
    :cond_4a
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2c
.end method

.method protected cleanupChildren()V
    .registers 2

    .prologue
    .line 199
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 201
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 203
    :cond_b
    return-void
.end method

.method public clear()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 98
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    .line 99
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 100
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 101
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 102
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 103
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 6

    .prologue
    .line 427
    :try_start_0
    new-instance v2, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/xmp/options/PropertyOptions;->getOptions()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/adobe/xmp/options/PropertyOptions;-><init>(I)V
    :try_end_d
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_d} :catch_1a

    .line 435
    .local v2, "newOptions":Lcom/adobe/xmp/options/PropertyOptions;
    :goto_d
    new-instance v1, Lcom/adobe/xmp/impl/XMPNode;

    iget-object v3, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    iget-object v4, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    invoke-direct {v1, v3, v4, v2}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 436
    .local v1, "newNode":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {p0, v1}, Lcom/adobe/xmp/impl/XMPNode;->cloneSubtree(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 438
    return-object v1

    .line 429
    .end local v1    # "newNode":Lcom/adobe/xmp/impl/XMPNode;
    .end local v2    # "newOptions":Lcom/adobe/xmp/options/PropertyOptions;
    :catch_1a
    move-exception v0

    .line 432
    .local v0, "e":Lcom/adobe/xmp/XMPException;
    new-instance v2, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v2}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    .restart local v2    # "newOptions":Lcom/adobe/xmp/options/PropertyOptions;
    goto :goto_d
.end method

.method public cloneSubtree(Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 7
    .param p1, "destination"    # Lcom/adobe/xmp/impl/XMPNode;

    .prologue
    .line 452
    :try_start_0
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_25

    .line 454
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    .line 455
    .local v0, "child":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {p1, v4}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V
    :try_end_19
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_19} :catch_1a

    goto :goto_4

    .line 464
    .end local v0    # "child":Lcom/adobe/xmp/impl/XMPNode;
    .end local v2    # "it":Ljava/util/Iterator;
    :catch_1a
    move-exception v1

    .line 467
    .local v1, "e":Lcom/adobe/xmp/XMPException;
    sget-boolean v4, Lcom/adobe/xmp/impl/XMPNode;->$assertionsDisabled:Z

    if-nez v4, :cond_3f

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 458
    .end local v1    # "e":Lcom/adobe/xmp/XMPException;
    .restart local v2    # "it":Ljava/util/Iterator;
    :cond_25
    :try_start_25
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v2

    :goto_29
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 460
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/xmp/impl/XMPNode;

    .line 461
    .local v3, "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {v3}, Lcom/adobe/xmp/impl/XMPNode;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {p1, v4}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V
    :try_end_3e
    .catch Lcom/adobe/xmp/XMPException; {:try_start_25 .. :try_end_3e} :catch_1a

    goto :goto_29

    .line 470
    .end local v2    # "it":Ljava/util/Iterator;
    .end local v3    # "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    :cond_3f
    return-void
.end method

.method public compareTo(Ljava/lang/Object;)I
    .registers 4
    .param p1, "xmpNode"    # Ljava/lang/Object;

    .prologue
    .line 491
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 493
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    check-cast p1, Lcom/adobe/xmp/impl/XMPNode;

    .end local p1    # "xmpNode":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 497
    :goto_16
    return v0

    .restart local p1    # "xmpNode":Ljava/lang/Object;
    :cond_17
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    check-cast p1, Lcom/adobe/xmp/impl/XMPNode;

    .end local p1    # "xmpNode":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_16
.end method

.method public dumpNode(Z)Ljava/lang/String;
    .registers 5
    .param p1, "recursive"    # Z

    .prologue
    const/4 v2, 0x0

    .line 480
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x200

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 481
    .local v0, "result":Ljava/lang/StringBuffer;
    invoke-direct {p0, v0, p1, v2, v2}, Lcom/adobe/xmp/impl/XMPNode;->dumpNode(Ljava/lang/StringBuffer;ZII)V

    .line 482
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public findChildByName(Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;
    .registers 3
    .param p1, "expr"    # Ljava/lang/String;

    .prologue
    .line 232
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/adobe/xmp/impl/XMPNode;->find(Ljava/util/List;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    return-object v0
.end method

.method public findQualifierByName(Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;
    .registers 3
    .param p1, "expr"    # Ljava/lang/String;

    .prologue
    .line 341
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    invoke-direct {p0, v0, p1}, Lcom/adobe/xmp/impl/XMPNode;->find(Ljava/util/List;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    return-object v0
.end method

.method public getChild(I)Lcom/adobe/xmp/impl/XMPNode;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 121
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    return-object v0
.end method

.method public getChildrenLength()I
    .registers 2

    .prologue
    .line 220
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getHasAliases()Z
    .registers 2

    .prologue
    .line 584
    iget-boolean v0, p0, Lcom/adobe/xmp/impl/XMPNode;->hasAliases:Z

    return v0
.end method

.method public getHasValueChild()Z
    .registers 2

    .prologue
    .line 620
    iget-boolean v0, p0, Lcom/adobe/xmp/impl/XMPNode;->hasValueChild:Z

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 507
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOptions()Lcom/adobe/xmp/options/PropertyOptions;
    .registers 2

    .prologue
    .line 543
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    if-nez v0, :cond_b

    .line 545
    new-instance v0, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v0}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    .line 547
    :cond_b
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    return-object v0
.end method

.method public getParent()Lcom/adobe/xmp/impl/XMPNode;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->parent:Lcom/adobe/xmp/impl/XMPNode;

    return-object v0
.end method

.method public getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 242
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    return-object v0
.end method

.method public getQualifierLength()I
    .registers 2

    .prologue
    .line 251
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getUnmodifiableChildren()Ljava/util/List;
    .registers 3

    .prologue
    .line 838
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 525
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hasChildren()Z
    .registers 2

    .prologue
    .line 350
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public hasQualifier()Z
    .registers 2

    .prologue
    .line 376
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isAlias()Z
    .registers 2

    .prologue
    .line 602
    iget-boolean v0, p0, Lcom/adobe/xmp/impl/XMPNode;->alias:Z

    return v0
.end method

.method public isImplicit()Z
    .registers 2

    .prologue
    .line 566
    iget-boolean v0, p0, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    return v0
.end method

.method public iterateChildren()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 360
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    if-eqz v0, :cond_d

    .line 362
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 366
    :goto_c
    return-object v0

    :cond_d
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    goto :goto_c
.end method

.method public iterateQualifier()Ljava/util/Iterator;
    .registers 3

    .prologue
    .line 386
    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    if-eqz v1, :cond_12

    .line 388
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 390
    .local v0, "it":Ljava/util/Iterator;
    new-instance v1, Lcom/adobe/xmp/impl/XMPNode$1;

    invoke-direct {v1, p0, v0}, Lcom/adobe/xmp/impl/XMPNode$1;-><init>(Lcom/adobe/xmp/impl/XMPNode;Ljava/util/Iterator;)V

    .line 412
    .end local v0    # "it":Ljava/util/Iterator;
    :goto_11
    return-object v1

    :cond_12
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    goto :goto_11
.end method

.method public removeChild(I)V
    .registers 4
    .param p1, "itemIndex"    # I

    .prologue
    .line 174
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 175
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->cleanupChildren()V

    .line 176
    return-void
.end method

.method public removeChild(Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 3
    .param p1, "node"    # Lcom/adobe/xmp/impl/XMPNode;

    .prologue
    .line 187
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 188
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->cleanupChildren()V

    .line 189
    return-void
.end method

.method public removeChildren()V
    .registers 2

    .prologue
    .line 211
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 212
    return-void
.end method

.method public removeQualifier(Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 5
    .param p1, "qualNode"    # Lcom/adobe/xmp/impl/XMPNode;

    .prologue
    const/4 v2, 0x0

    .line 298
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    .line 299
    .local v0, "opts":Lcom/adobe/xmp/options/PropertyOptions;
    invoke-direct {p1}, Lcom/adobe/xmp/impl/XMPNode;->isLanguageNode()Z

    move-result v1

    if-eqz v1, :cond_24

    .line 302
    invoke-virtual {v0, v2}, Lcom/adobe/xmp/options/PropertyOptions;->setHasLanguage(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 310
    :cond_e
    :goto_e
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 311
    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_23

    .line 313
    invoke-virtual {v0, v2}, Lcom/adobe/xmp/options/PropertyOptions;->setHasQualifiers(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 314
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 317
    :cond_23
    return-void

    .line 304
    :cond_24
    invoke-direct {p1}, Lcom/adobe/xmp/impl/XMPNode;->isTypeNode()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 307
    invoke-virtual {v0, v2}, Lcom/adobe/xmp/options/PropertyOptions;->setHasType(Z)Lcom/adobe/xmp/options/PropertyOptions;

    goto :goto_e
.end method

.method public removeQualifiers()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 325
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    .line 327
    .local v0, "opts":Lcom/adobe/xmp/options/PropertyOptions;
    invoke-virtual {v0, v1}, Lcom/adobe/xmp/options/PropertyOptions;->setHasQualifiers(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 328
    invoke-virtual {v0, v1}, Lcom/adobe/xmp/options/PropertyOptions;->setHasLanguage(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 329
    invoke-virtual {v0, v1}, Lcom/adobe/xmp/options/PropertyOptions;->setHasType(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 330
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 331
    return-void
.end method

.method public replaceChild(ILcom/adobe/xmp/impl/XMPNode;)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "node"    # Lcom/adobe/xmp/impl/XMPNode;

    .prologue
    .line 163
    invoke-virtual {p2, p0}, Lcom/adobe/xmp/impl/XMPNode;->setParent(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 164
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 165
    return-void
.end method

.method public setAlias(Z)V
    .registers 2
    .param p1, "alias"    # Z

    .prologue
    .line 611
    iput-boolean p1, p0, Lcom/adobe/xmp/impl/XMPNode;->alias:Z

    .line 612
    return-void
.end method

.method public setHasAliases(Z)V
    .registers 2
    .param p1, "hasAliases"    # Z

    .prologue
    .line 593
    iput-boolean p1, p0, Lcom/adobe/xmp/impl/XMPNode;->hasAliases:Z

    .line 594
    return-void
.end method

.method public setHasValueChild(Z)V
    .registers 2
    .param p1, "hasValueChild"    # Z

    .prologue
    .line 629
    iput-boolean p1, p0, Lcom/adobe/xmp/impl/XMPNode;->hasValueChild:Z

    .line 630
    return-void
.end method

.method public setImplicit(Z)V
    .registers 2
    .param p1, "implicit"    # Z

    .prologue
    .line 575
    iput-boolean p1, p0, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    .line 576
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 516
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 517
    return-void
.end method

.method public setOptions(Lcom/adobe/xmp/options/PropertyOptions;)V
    .registers 2
    .param p1, "options"    # Lcom/adobe/xmp/options/PropertyOptions;

    .prologue
    .line 557
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    .line 558
    return-void
.end method

.method protected setParent(Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 2
    .param p1, "parent"    # Lcom/adobe/xmp/impl/XMPNode;

    .prologue
    .line 864
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPNode;->parent:Lcom/adobe/xmp/impl/XMPNode;

    .line 865
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 534
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 535
    return-void
.end method

.method public sort()V
    .registers 7

    .prologue
    .line 648
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v4

    if-eqz v4, :cond_5f

    .line 650
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v4

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifierLength()I

    move-result v5

    new-array v5, v5, [Lcom/adobe/xmp/impl/XMPNode;

    invoke-interface {v4, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/adobe/xmp/impl/XMPNode;

    move-object v2, v4

    check-cast v2, [Lcom/adobe/xmp/impl/XMPNode;

    .line 652
    .local v2, "quals":[Lcom/adobe/xmp/impl/XMPNode;
    const/4 v3, 0x0

    .line 654
    .local v3, "sortFrom":I
    :goto_1a
    array-length v4, v2

    if-le v4, v3, :cond_41

    const-string v4, "xml:lang"

    aget-object v5, v2, v3

    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_39

    const-string v4, "rdf:type"

    aget-object v5, v2, v3

    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_41

    .line 659
    :cond_39
    aget-object v4, v2, v3

    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->sort()V

    .line 660
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    .line 663
    :cond_41
    array-length v4, v2

    invoke-static {v2, v3, v4}, Ljava/util/Arrays;->sort([Ljava/lang/Object;II)V

    .line 664
    iget-object v4, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 665
    .local v0, "it":Ljava/util/ListIterator;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_4c
    array-length v4, v2

    if-ge v1, v4, :cond_5f

    .line 667
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    .line 668
    aget-object v4, v2, v1

    invoke-interface {v0, v4}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    .line 669
    aget-object v4, v2, v1

    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->sort()V

    .line 665
    add-int/lit8 v1, v1, 0x1

    goto :goto_4c

    .line 674
    .end local v0    # "it":Ljava/util/ListIterator;
    .end local v1    # "j":I
    .end local v2    # "quals":[Lcom/adobe/xmp/impl/XMPNode;
    .end local v3    # "sortFrom":I
    :cond_5f
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v4

    if-eqz v4, :cond_88

    .line 676
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result v4

    if-nez v4, :cond_74

    .line 678
    iget-object v4, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    invoke-static {v4}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 680
    :cond_74
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_78
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_88

    .line 682
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->sort()V

    goto :goto_78

    .line 686
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_88
    return-void
.end method
