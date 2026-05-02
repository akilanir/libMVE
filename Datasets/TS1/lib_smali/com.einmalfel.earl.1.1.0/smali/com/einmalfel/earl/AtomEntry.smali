.class public Lcom/einmalfel/earl/AtomEntry;
.super Lcom/einmalfel/earl/AtomCommonAttributes;
.source "AtomEntry.java"

# interfaces
.implements Lcom/einmalfel/earl/Item;


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.AtomEntry"

.field static final XML_TAG:Ljava/lang/String; = "entry"


# instance fields
.field public final authors:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomPerson;",
            ">;"
        }
    .end annotation
.end field

.field public final categories:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomCategory;",
            ">;"
        }
    .end annotation
.end field

.field public final content:Lcom/einmalfel/earl/AtomContent;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final contributors:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomPerson;",
            ">;"
        }
    .end annotation
.end field

.field public final id:Ljava/net/URI;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final links:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomLink;",
            ">;"
        }
    .end annotation
.end field

.field public final published:Lcom/einmalfel/earl/AtomDate;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final rights:Lcom/einmalfel/earl/AtomText;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final source:Lcom/einmalfel/earl/AtomFeed;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final summary:Lcom/einmalfel/earl/AtomText;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final title:Lcom/einmalfel/earl/AtomText;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final updated:Lcom/einmalfel/earl/AtomDate;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/net/URI;Lcom/einmalfel/earl/AtomText;Lcom/einmalfel/earl/AtomDate;Ljava/util/List;Lcom/einmalfel/earl/AtomContent;Ljava/util/List;Lcom/einmalfel/earl/AtomText;Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/AtomDate;Lcom/einmalfel/earl/AtomFeed;Lcom/einmalfel/earl/AtomText;)V
    .registers 15
    .param p1, "atomCommonAttributes"    # Lcom/einmalfel/earl/AtomCommonAttributes;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "id"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "title"    # Lcom/einmalfel/earl/AtomText;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "updated"    # Lcom/einmalfel/earl/AtomDate;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p6, "content"    # Lcom/einmalfel/earl/AtomContent;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p8, "summary"    # Lcom/einmalfel/earl/AtomText;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p10    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p11, "published"    # Lcom/einmalfel/earl/AtomDate;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p12, "source"    # Lcom/einmalfel/earl/AtomFeed;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p13, "rights"    # Lcom/einmalfel/earl/AtomText;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/einmalfel/earl/AtomCommonAttributes;",
            "Ljava/net/URI;",
            "Lcom/einmalfel/earl/AtomText;",
            "Lcom/einmalfel/earl/AtomDate;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomPerson;",
            ">;",
            "Lcom/einmalfel/earl/AtomContent;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomLink;",
            ">;",
            "Lcom/einmalfel/earl/AtomText;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomCategory;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomPerson;",
            ">;",
            "Lcom/einmalfel/earl/AtomDate;",
            "Lcom/einmalfel/earl/AtomFeed;",
            "Lcom/einmalfel/earl/AtomText;",
            ")V"
        }
    .end annotation

    .prologue
    .line 136
    .local p5, "authors":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomPerson;>;"
    .local p7, "links":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomLink;>;"
    .local p9, "categories":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomCategory;>;"
    .local p10, "contributors":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomPerson;>;"
    invoke-direct {p0, p1}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;)V

    .line 137
    iput-object p2, p0, Lcom/einmalfel/earl/AtomEntry;->id:Ljava/net/URI;

    .line 138
    iput-object p3, p0, Lcom/einmalfel/earl/AtomEntry;->title:Lcom/einmalfel/earl/AtomText;

    .line 139
    iput-object p4, p0, Lcom/einmalfel/earl/AtomEntry;->updated:Lcom/einmalfel/earl/AtomDate;

    .line 140
    invoke-static {p5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->authors:Ljava/util/List;

    .line 141
    iput-object p6, p0, Lcom/einmalfel/earl/AtomEntry;->content:Lcom/einmalfel/earl/AtomContent;

    .line 142
    invoke-static {p7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->links:Ljava/util/List;

    .line 143
    iput-object p8, p0, Lcom/einmalfel/earl/AtomEntry;->summary:Lcom/einmalfel/earl/AtomText;

    .line 144
    invoke-static {p9}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->categories:Ljava/util/List;

    .line 145
    invoke-static {p10}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->contributors:Ljava/util/List;

    .line 146
    iput-object p11, p0, Lcom/einmalfel/earl/AtomEntry;->published:Lcom/einmalfel/earl/AtomDate;

    .line 147
    iput-object p12, p0, Lcom/einmalfel/earl/AtomEntry;->source:Lcom/einmalfel/earl/AtomFeed;

    .line 148
    iput-object p13, p0, Lcom/einmalfel/earl/AtomEntry;->rights:Lcom/einmalfel/earl/AtomText;

    .line 149
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomEntry;
    .registers 20
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    const/4 v2, 0x2

    const/4 v4, 0x0

    const-string v17, "entry"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-interface {v0, v2, v4, v1}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 51
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    .line 52
    .local v7, "authors":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomPerson;>;"
    new-instance v9, Ljava/util/LinkedList;

    invoke-direct {v9}, Ljava/util/LinkedList;-><init>()V

    .line 53
    .local v9, "links":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomLink;>;"
    new-instance v11, Ljava/util/LinkedList;

    invoke-direct {v11}, Ljava/util/LinkedList;-><init>()V

    .line 54
    .local v11, "categories":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomCategory;>;"
    new-instance v12, Ljava/util/LinkedList;

    invoke-direct {v12}, Ljava/util/LinkedList;-><init>()V

    .line 55
    .local v12, "contributors":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomPerson;>;"
    const/4 v5, 0x0

    .line 56
    .local v5, "title":Lcom/einmalfel/earl/AtomText;
    const/4 v10, 0x0

    .line 57
    .local v10, "summary":Lcom/einmalfel/earl/AtomText;
    const/4 v15, 0x0

    .line 58
    .local v15, "rights":Lcom/einmalfel/earl/AtomText;
    const/4 v8, 0x0

    .line 59
    .local v8, "content":Lcom/einmalfel/earl/AtomContent;
    const/4 v14, 0x0

    .line 60
    .local v14, "source":Lcom/einmalfel/earl/AtomFeed;
    const/16 v16, 0x0

    .line 61
    .local v16, "id":Ljava/lang/String;
    const/4 v6, 0x0

    .line 62
    .local v6, "updated":Lcom/einmalfel/earl/AtomDate;
    const/4 v13, 0x0

    .line 64
    .local v13, "published":Lcom/einmalfel/earl/AtomDate;
    new-instance v3, Lcom/einmalfel/earl/AtomCommonAttributes;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 65
    .local v3, "atomCommonAttributes":Lcom/einmalfel/earl/AtomCommonAttributes;
    :goto_2f
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v2

    const/4 v4, 0x2

    if-ne v2, v4, :cond_18d

    .line 66
    const-string v2, "http://www.w3.org/2005/Atom"

    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_168

    .line 67
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const/4 v2, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v17

    sparse-switch v17, :sswitch_data_1d2

    :cond_4e
    :goto_4e
    packed-switch v2, :pswitch_data_204

    .line 105
    const-string v2, "Earl.AtomEntry"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Unknown tag in Atom entry "

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 112
    :goto_74
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_2f

    .line 67
    :sswitch_78
    const-string v17, "link"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const/4 v2, 0x0

    goto :goto_4e

    :sswitch_84
    const-string v17, "category"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const/4 v2, 0x1

    goto :goto_4e

    :sswitch_90
    const-string v17, "contributor"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const/4 v2, 0x2

    goto :goto_4e

    :sswitch_9c
    const-string v17, "author"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const/4 v2, 0x3

    goto :goto_4e

    :sswitch_a8
    const-string v17, "title"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const/4 v2, 0x4

    goto :goto_4e

    :sswitch_b4
    const-string v17, "summary"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const/4 v2, 0x5

    goto :goto_4e

    :sswitch_c0
    const-string v17, "rights"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const/4 v2, 0x6

    goto :goto_4e

    :sswitch_cc
    const-string v17, "id"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const/4 v2, 0x7

    goto/16 :goto_4e

    :sswitch_d9
    const-string v17, "published"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const/16 v2, 0x8

    goto/16 :goto_4e

    :sswitch_e7
    const-string v17, "updated"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const/16 v2, 0x9

    goto/16 :goto_4e

    :sswitch_f5
    const-string v17, "content"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const/16 v2, 0xa

    goto/16 :goto_4e

    :sswitch_103
    const-string v17, "feed"

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const/16 v2, 0xb

    goto/16 :goto_4e

    .line 69
    :pswitch_111
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomLink;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomLink;

    move-result-object v2

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_74

    .line 72
    :pswitch_11a
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomCategory;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomCategory;

    move-result-object v2

    invoke-interface {v11, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_74

    .line 75
    :pswitch_123
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomPerson;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomPerson;

    move-result-object v2

    invoke-interface {v12, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_74

    .line 78
    :pswitch_12c
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomPerson;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomPerson;

    move-result-object v2

    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_74

    .line 81
    :pswitch_135
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomText;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomText;

    move-result-object v5

    .line 82
    goto/16 :goto_74

    .line 84
    :pswitch_13b
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomText;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomText;

    move-result-object v10

    .line 85
    goto/16 :goto_74

    .line 87
    :pswitch_141
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomText;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomText;

    move-result-object v15

    .line 88
    goto/16 :goto_74

    .line 90
    :pswitch_147
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v16

    .line 91
    goto/16 :goto_74

    .line 93
    :pswitch_14d
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomDate;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomDate;

    move-result-object v13

    .line 94
    goto/16 :goto_74

    .line 96
    :pswitch_153
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomDate;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomDate;

    move-result-object v6

    .line 97
    goto/16 :goto_74

    .line 99
    :pswitch_159
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomContent;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomContent;

    move-result-object v8

    .line 100
    goto/16 :goto_74

    .line 102
    :pswitch_15f
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/einmalfel/earl/AtomFeed;->read(Lorg/xmlpull/v1/XmlPullParser;I)Lcom/einmalfel/earl/AtomFeed;

    move-result-object v14

    .line 103
    goto/16 :goto_74

    .line 109
    :cond_168
    const-string v2, "Earl.AtomEntry"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Unknown namespace in Atom item "

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_74

    .line 115
    :cond_18d
    if-nez v5, :cond_1a8

    .line 116
    const-string v2, "Earl.AtomEntry"

    const-string v4, "No title found for atom entry"

    new-instance v17, Ljava/lang/NullPointerException;

    invoke-direct/range {v17 .. v17}, Ljava/lang/NullPointerException;-><init>()V

    move-object/from16 v0, v17

    invoke-static {v2, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 117
    new-instance v5, Lcom/einmalfel/earl/AtomText;

    .end local v5    # "title":Lcom/einmalfel/earl/AtomText;
    const/4 v2, 0x0

    const/4 v4, 0x0

    const-string v17, ""

    move-object/from16 v0, v17

    invoke-direct {v5, v2, v4, v0}, Lcom/einmalfel/earl/AtomText;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .restart local v5    # "title":Lcom/einmalfel/earl/AtomText;
    :cond_1a8
    if-nez v6, :cond_1c7

    .line 120
    const-string v2, "Earl.AtomEntry"

    const-string v4, "No updated found for atom entry, replaced with zero"

    new-instance v17, Ljava/lang/NullPointerException;

    invoke-direct/range {v17 .. v17}, Ljava/lang/NullPointerException;-><init>()V

    move-object/from16 v0, v17

    invoke-static {v2, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 121
    new-instance v6, Lcom/einmalfel/earl/AtomDate;

    .end local v6    # "updated":Lcom/einmalfel/earl/AtomDate;
    const/4 v2, 0x0

    new-instance v4, Ljava/util/Date;

    const-wide/16 v17, 0x0

    move-wide/from16 v0, v17

    invoke-direct {v4, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-direct {v6, v2, v4}, Lcom/einmalfel/earl/AtomDate;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/util/Date;)V

    .line 124
    .restart local v6    # "updated":Lcom/einmalfel/earl/AtomDate;
    :cond_1c7
    new-instance v2, Lcom/einmalfel/earl/AtomEntry;

    .line 125
    invoke-static/range {v16 .. v16}, Lcom/einmalfel/earl/Utils;->nonNullUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v4

    invoke-direct/range {v2 .. v15}, Lcom/einmalfel/earl/AtomEntry;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/net/URI;Lcom/einmalfel/earl/AtomText;Lcom/einmalfel/earl/AtomDate;Ljava/util/List;Lcom/einmalfel/earl/AtomContent;Ljava/util/List;Lcom/einmalfel/earl/AtomText;Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/AtomDate;Lcom/einmalfel/earl/AtomFeed;Lcom/einmalfel/earl/AtomText;)V

    return-object v2

    .line 67
    nop

    :sswitch_data_1d2
    .sparse-switch
        -0x70f79f25 -> :sswitch_90
        -0x6eb9585a -> :sswitch_b4
        -0x53d2de75 -> :sswitch_9c
        -0x377f7e29 -> :sswitch_c0
        -0xdf91f45 -> :sswitch_e7
        0xd1b -> :sswitch_cc
        0x2fe59e -> :sswitch_103
        0x32affa -> :sswitch_78
        0x302bcfe -> :sswitch_84
        0x6942258 -> :sswitch_a8
        0x38b73479 -> :sswitch_f5
        0x5645a1ee -> :sswitch_d9
    .end sparse-switch

    :pswitch_data_204
    .packed-switch 0x0
        :pswitch_111
        :pswitch_11a
        :pswitch_123
        :pswitch_12c
        :pswitch_135
        :pswitch_13b
        :pswitch_141
        :pswitch_147
        :pswitch_14d
        :pswitch_153
        :pswitch_159
        :pswitch_15f
    .end packed-switch
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .registers 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 207
    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->authors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 208
    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->contributors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13

    const/4 v0, 0x0

    .line 210
    :goto_12
    return-object v0

    .line 208
    :cond_13
    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->contributors:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomPerson;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomPerson;->name:Ljava/lang/String;

    goto :goto_12

    .line 210
    :cond_1e
    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->authors:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomPerson;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomPerson;->name:Ljava/lang/String;

    goto :goto_12
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 195
    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->summary:Lcom/einmalfel/earl/AtomText;

    if-nez v0, :cond_f

    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->content:Lcom/einmalfel/earl/AtomContent;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->content:Lcom/einmalfel/earl/AtomContent;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomContent;->value:Ljava/lang/String;

    goto :goto_9

    :cond_f
    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->summary:Lcom/einmalfel/earl/AtomText;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomText;->value:Ljava/lang/String;

    goto :goto_9
.end method

.method public getEnclosures()Ljava/util/List;
    .registers 6
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/einmalfel/earl/Enclosure;",
            ">;"
        }
    .end annotation

    .prologue
    .line 217
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 218
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/Enclosure;>;"
    iget-object v2, p0, Lcom/einmalfel/earl/AtomEntry;->links:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomLink;

    .line 219
    .local v0, "link":Lcom/einmalfel/earl/AtomLink;
    iget-object v3, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    if-eqz v3, :cond_b

    const-string v3, "enclosure"

    iget-object v4, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 220
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 223
    .end local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    :cond_29
    return-object v1
.end method

.method public getId()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 229
    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->id:Ljava/net/URI;

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageLink()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 201
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLink()Ljava/lang/String;
    .registers 5
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 154
    iget-object v1, p0, Lcom/einmalfel/earl/AtomEntry;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 155
    const/4 v1, 0x0

    .line 177
    :goto_9
    return-object v1

    .line 157
    :cond_a
    iget-object v1, p0, Lcom/einmalfel/earl/AtomEntry;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_31

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomLink;

    .line 158
    .local v0, "link":Lcom/einmalfel/earl/AtomLink;
    iget-object v2, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    if-eqz v2, :cond_10

    const-string v2, "alternate"

    iget-object v3, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 159
    iget-object v1, v0, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    .line 161
    .end local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    :cond_31
    iget-object v1, p0, Lcom/einmalfel/earl/AtomEntry;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_37
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_58

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomLink;

    .line 162
    .restart local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    iget-object v2, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    if-eqz v2, :cond_37

    const-string v2, "via"

    iget-object v3, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37

    .line 163
    iget-object v1, v0, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    .line 165
    .end local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    :cond_58
    iget-object v1, p0, Lcom/einmalfel/earl/AtomEntry;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_5e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomLink;

    .line 166
    .restart local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    iget-object v2, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    if-eqz v2, :cond_5e

    const-string v2, "related"

    iget-object v3, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 167
    iget-object v1, v0, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    .line 169
    .end local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    :cond_7f
    iget-object v1, p0, Lcom/einmalfel/earl/AtomEntry;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_85
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomLink;

    .line 170
    .restart local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    iget-object v2, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    if-nez v2, :cond_85

    .line 171
    iget-object v1, v0, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_9

    .line 173
    .end local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    :cond_9d
    iget-object v1, p0, Lcom/einmalfel/earl/AtomEntry;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_cf

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomLink;

    .line 174
    .restart local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    iget-object v2, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    if-eqz v2, :cond_a3

    const-string v2, "enclosure"

    iget-object v3, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a3

    const-string v2, "self"

    iget-object v3, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a3

    .line 175
    iget-object v1, v0, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_9

    .line 177
    .end local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    :cond_cf
    iget-object v1, p0, Lcom/einmalfel/earl/AtomEntry;->links:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/einmalfel/earl/AtomLink;

    iget-object v1, v1, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_9
.end method

.method public getPublicationDate()Ljava/util/Date;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 183
    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->published:Lcom/einmalfel/earl/AtomDate;

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->updated:Lcom/einmalfel/earl/AtomDate;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomDate;->date:Ljava/util/Date;

    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->published:Lcom/einmalfel/earl/AtomDate;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomDate;->date:Ljava/util/Date;

    goto :goto_8
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 189
    iget-object v0, p0, Lcom/einmalfel/earl/AtomEntry;->title:Lcom/einmalfel/earl/AtomText;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomText;->value:Ljava/lang/String;

    return-object v0
.end method
