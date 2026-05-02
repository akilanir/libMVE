.class final Lfreemarker/ext/jdom/NodeListModel$TypeFilter;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jdom/NodeListModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "TypeFilter"
.end annotation


# instance fields
.field private final this$0:Lfreemarker/ext/jdom/NodeListModel;


# direct methods
.method private constructor <init>(Lfreemarker/ext/jdom/NodeListModel;)V
    .registers 2

    .prologue
    .line 1193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/jdom/NodeListModel$TypeFilter;->this$0:Lfreemarker/ext/jdom/NodeListModel;

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel;Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 3
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel;
    .param p2, "x1"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 1193
    invoke-direct {p0, p1}, Lfreemarker/ext/jdom/NodeListModel$TypeFilter;-><init>(Lfreemarker/ext/jdom/NodeListModel;)V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 18
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1203
    if-eqz p1, :cond_8

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v14

    if-nez v14, :cond_10

    .line 1204
    :cond_8
    new-instance v14, Lfreemarker/template/TemplateModelException;

    const-string v15, "_type expects exactly one argument"

    invoke-direct {v14, v15}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 1205
    :cond_10
    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1206
    .local v2, "arg":Ljava/lang/String;
    const/16 v14, 0x21

    invoke-virtual {v2, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v15, -0x1

    if-eq v14, v15, :cond_e0

    const/4 v6, 0x1

    .line 1210
    .local v6, "invert":Z
    :goto_23
    const/16 v14, 0x61

    invoke-virtual {v2, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v15, -0x1

    if-ne v14, v15, :cond_e3

    const/4 v14, 0x1

    :goto_2d
    if-eq v6, v14, :cond_e6

    const/4 v1, 0x1

    .line 1211
    .local v1, "a":Z
    :goto_30
    const/16 v14, 0x63

    invoke-virtual {v2, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v15, -0x1

    if-ne v14, v15, :cond_e9

    const/4 v14, 0x1

    :goto_3a
    if-eq v6, v14, :cond_ec

    const/4 v3, 0x1

    .line 1212
    .local v3, "c":Z
    :goto_3d
    const/16 v14, 0x64

    invoke-virtual {v2, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v15, -0x1

    if-ne v14, v15, :cond_ef

    const/4 v14, 0x1

    :goto_47
    if-eq v6, v14, :cond_f2

    const/4 v4, 0x1

    .line 1213
    .local v4, "d":Z
    :goto_4a
    const/16 v14, 0x65

    invoke-virtual {v2, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v15, -0x1

    if-ne v14, v15, :cond_f5

    const/4 v14, 0x1

    :goto_54
    if-eq v6, v14, :cond_f8

    const/4 v5, 0x1

    .line 1214
    .local v5, "e":Z
    :goto_57
    const/16 v14, 0x6e

    invoke-virtual {v2, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v15, -0x1

    if-ne v14, v15, :cond_fb

    const/4 v14, 0x1

    :goto_61
    if-eq v6, v14, :cond_fe

    const/4 v9, 0x1

    .line 1215
    .local v9, "n":Z
    :goto_64
    const/16 v14, 0x70

    invoke-virtual {v2, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v15, -0x1

    if-ne v14, v15, :cond_101

    const/4 v14, 0x1

    :goto_6e
    if-eq v6, v14, :cond_104

    const/4 v11, 0x1

    .line 1216
    .local v11, "p":Z
    :goto_71
    const/16 v14, 0x74

    invoke-virtual {v2, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v15, -0x1

    if-ne v14, v15, :cond_107

    const/4 v14, 0x1

    :goto_7b
    if-eq v6, v14, :cond_10a

    const/4 v12, 0x1

    .line 1217
    .local v12, "t":Z
    :goto_7e
    const/16 v14, 0x78

    invoke-virtual {v2, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v14

    const/4 v15, -0x1

    if-ne v14, v15, :cond_10d

    const/4 v14, 0x1

    :goto_88
    if-eq v6, v14, :cond_110

    const/4 v13, 0x1

    .line 1219
    .local v13, "x":Z
    :goto_8b
    new-instance v8, Ljava/util/LinkedList;

    move-object/from16 v0, p0

    iget-object v14, v0, Lfreemarker/ext/jdom/NodeListModel$TypeFilter;->this$0:Lfreemarker/ext/jdom/NodeListModel;

    invoke-static {v14}, Lfreemarker/ext/jdom/NodeListModel;->access$800(Lfreemarker/ext/jdom/NodeListModel;)Ljava/util/List;

    move-result-object v14

    invoke-direct {v8, v14}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 1220
    .local v8, "list":Ljava/util/LinkedList;
    invoke-virtual {v8}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 1221
    .local v7, "it":Ljava/util/Iterator;
    :cond_9c
    :goto_9c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_113

    .line 1222
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .line 1223
    .local v10, "node":Ljava/lang/Object;
    instance-of v14, v10, Lorg/jdom/Element;

    if-eqz v14, :cond_ac

    if-nez v5, :cond_dc

    :cond_ac
    instance-of v14, v10, Lorg/jdom/Attribute;

    if-eqz v14, :cond_b2

    if-nez v1, :cond_dc

    :cond_b2
    instance-of v14, v10, Ljava/lang/String;

    if-eqz v14, :cond_b8

    if-nez v13, :cond_dc

    :cond_b8
    instance-of v14, v10, Lorg/jdom/Text;

    if-eqz v14, :cond_be

    if-nez v13, :cond_dc

    :cond_be
    instance-of v14, v10, Lorg/jdom/ProcessingInstruction;

    if-eqz v14, :cond_c4

    if-nez v11, :cond_dc

    :cond_c4
    instance-of v14, v10, Lorg/jdom/Comment;

    if-eqz v14, :cond_ca

    if-nez v3, :cond_dc

    :cond_ca
    instance-of v14, v10, Lorg/jdom/EntityRef;

    if-eqz v14, :cond_d0

    if-nez v9, :cond_dc

    :cond_d0
    instance-of v14, v10, Lorg/jdom/Document;

    if-eqz v14, :cond_d6

    if-nez v4, :cond_dc

    :cond_d6
    instance-of v14, v10, Lorg/jdom/DocType;

    if-eqz v14, :cond_9c

    if-eqz v12, :cond_9c

    .line 1232
    :cond_dc
    invoke-interface {v7}, Ljava/util/Iterator;->remove()V

    goto :goto_9c

    .line 1206
    .end local v1    # "a":Z
    .end local v3    # "c":Z
    .end local v4    # "d":Z
    .end local v5    # "e":Z
    .end local v6    # "invert":Z
    .end local v7    # "it":Ljava/util/Iterator;
    .end local v8    # "list":Ljava/util/LinkedList;
    .end local v9    # "n":Z
    .end local v10    # "node":Ljava/lang/Object;
    .end local v11    # "p":Z
    .end local v12    # "t":Z
    .end local v13    # "x":Z
    :cond_e0
    const/4 v6, 0x0

    goto/16 :goto_23

    .line 1210
    .restart local v6    # "invert":Z
    :cond_e3
    const/4 v14, 0x0

    goto/16 :goto_2d

    :cond_e6
    const/4 v1, 0x0

    goto/16 :goto_30

    .line 1211
    .restart local v1    # "a":Z
    :cond_e9
    const/4 v14, 0x0

    goto/16 :goto_3a

    :cond_ec
    const/4 v3, 0x0

    goto/16 :goto_3d

    .line 1212
    .restart local v3    # "c":Z
    :cond_ef
    const/4 v14, 0x0

    goto/16 :goto_47

    :cond_f2
    const/4 v4, 0x0

    goto/16 :goto_4a

    .line 1213
    .restart local v4    # "d":Z
    :cond_f5
    const/4 v14, 0x0

    goto/16 :goto_54

    :cond_f8
    const/4 v5, 0x0

    goto/16 :goto_57

    .line 1214
    .restart local v5    # "e":Z
    :cond_fb
    const/4 v14, 0x0

    goto/16 :goto_61

    :cond_fe
    const/4 v9, 0x0

    goto/16 :goto_64

    .line 1215
    .restart local v9    # "n":Z
    :cond_101
    const/4 v14, 0x0

    goto/16 :goto_6e

    :cond_104
    const/4 v11, 0x0

    goto/16 :goto_71

    .line 1216
    .restart local v11    # "p":Z
    :cond_107
    const/4 v14, 0x0

    goto/16 :goto_7b

    :cond_10a
    const/4 v12, 0x0

    goto/16 :goto_7e

    .line 1217
    .restart local v12    # "t":Z
    :cond_10d
    const/4 v14, 0x0

    goto/16 :goto_88

    :cond_110
    const/4 v13, 0x0

    goto/16 :goto_8b

    .line 1234
    .restart local v7    # "it":Ljava/util/Iterator;
    .restart local v8    # "list":Ljava/util/LinkedList;
    .restart local v13    # "x":Z
    :cond_113
    move-object/from16 v0, p0

    iget-object v14, v0, Lfreemarker/ext/jdom/NodeListModel$TypeFilter;->this$0:Lfreemarker/ext/jdom/NodeListModel;

    invoke-static {v14}, Lfreemarker/ext/jdom/NodeListModel;->access$900(Lfreemarker/ext/jdom/NodeListModel;)Ljava/util/Map;

    move-result-object v14

    invoke-static {v8, v14}, Lfreemarker/ext/jdom/NodeListModel;->access$2600(Ljava/util/List;Ljava/util/Map;)Lfreemarker/ext/jdom/NodeListModel;

    move-result-object v14

    return-object v14
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 1196
    const/4 v0, 0x0

    return v0
.end method
