.class public Lcom/einmalfel/earl/AtomFeed;
.super Lcom/einmalfel/earl/AtomCommonAttributes;
.source "AtomFeed.java"

# interfaces
.implements Lcom/einmalfel/earl/Feed;


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.AtomFeed"

.field static final XML_TAG:Ljava/lang/String; = "feed"


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

.field public final entries:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomEntry;",
            ">;"
        }
    .end annotation
.end field

.field public final generator:Lcom/einmalfel/earl/AtomGenerator;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final icon:Ljava/net/URI;
    .annotation build Landroid/support/annotation/Nullable;
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

.field public final logo:Ljava/net/URI;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final rights:Lcom/einmalfel/earl/AtomText;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final subtitle:Lcom/einmalfel/earl/AtomText;
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
.method public constructor <init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/net/URI;Lcom/einmalfel/earl/AtomText;Lcom/einmalfel/earl/AtomDate;Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/AtomGenerator;Ljava/net/URI;Ljava/net/URI;Lcom/einmalfel/earl/AtomText;Lcom/einmalfel/earl/AtomText;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .registers 16
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
    .param p6    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p7, "generator"    # Lcom/einmalfel/earl/AtomGenerator;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p8, "icon"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p9, "logo"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p10, "rights"    # Lcom/einmalfel/earl/AtomText;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p11, "subtitle"    # Lcom/einmalfel/earl/AtomText;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p12    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p13    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p14    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
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
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomPerson;",
            ">;",
            "Lcom/einmalfel/earl/AtomGenerator;",
            "Ljava/net/URI;",
            "Ljava/net/URI;",
            "Lcom/einmalfel/earl/AtomText;",
            "Lcom/einmalfel/earl/AtomText;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomLink;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomCategory;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/AtomEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 142
    .local p5, "authors":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomPerson;>;"
    .local p6, "contributors":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomPerson;>;"
    .local p12, "links":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomLink;>;"
    .local p13, "categories":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomCategory;>;"
    .local p14, "entries":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomEntry;>;"
    invoke-direct {p0, p1}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;)V

    .line 143
    iput-object p2, p0, Lcom/einmalfel/earl/AtomFeed;->id:Ljava/net/URI;

    .line 144
    iput-object p3, p0, Lcom/einmalfel/earl/AtomFeed;->title:Lcom/einmalfel/earl/AtomText;

    .line 145
    iput-object p4, p0, Lcom/einmalfel/earl/AtomFeed;->updated:Lcom/einmalfel/earl/AtomDate;

    .line 146
    invoke-static {p5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->authors:Ljava/util/List;

    .line 147
    invoke-static {p6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->contributors:Ljava/util/List;

    .line 148
    iput-object p7, p0, Lcom/einmalfel/earl/AtomFeed;->generator:Lcom/einmalfel/earl/AtomGenerator;

    .line 149
    iput-object p8, p0, Lcom/einmalfel/earl/AtomFeed;->icon:Ljava/net/URI;

    .line 150
    iput-object p9, p0, Lcom/einmalfel/earl/AtomFeed;->logo:Ljava/net/URI;

    .line 151
    iput-object p10, p0, Lcom/einmalfel/earl/AtomFeed;->rights:Lcom/einmalfel/earl/AtomText;

    .line 152
    iput-object p11, p0, Lcom/einmalfel/earl/AtomFeed;->subtitle:Lcom/einmalfel/earl/AtomText;

    .line 153
    invoke-static {p12}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->links:Ljava/util/List;

    .line 154
    invoke-static {p13}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->categories:Ljava/util/List;

    .line 155
    invoke-static {p14}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->entries:Ljava/util/List;

    .line 156
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;I)Lcom/einmalfel/earl/AtomFeed;
    .registers 23
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "maxItm"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 51
    const/4 v2, 0x2

    const/4 v4, 0x0

    const-string v19, "feed"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-interface {v0, v2, v4, v1}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 53
    new-instance v16, Ljava/util/LinkedList;

    invoke-direct/range {v16 .. v16}, Ljava/util/LinkedList;-><init>()V

    .line 54
    .local v16, "entries":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomEntry;>;"
    new-instance v8, Ljava/util/LinkedList;

    invoke-direct {v8}, Ljava/util/LinkedList;-><init>()V

    .line 55
    .local v8, "contributors":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomPerson;>;"
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    .line 56
    .local v7, "authors":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomPerson;>;"
    new-instance v14, Ljava/util/LinkedList;

    invoke-direct {v14}, Ljava/util/LinkedList;-><init>()V

    .line 57
    .local v14, "links":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomLink;>;"
    new-instance v15, Ljava/util/LinkedList;

    invoke-direct {v15}, Ljava/util/LinkedList;-><init>()V

    .line 58
    .local v15, "categories":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/AtomCategory;>;"
    const/4 v5, 0x0

    .line 59
    .local v5, "title":Lcom/einmalfel/earl/AtomText;
    const/4 v9, 0x0

    .line 60
    .local v9, "generator":Lcom/einmalfel/earl/AtomGenerator;
    const/4 v12, 0x0

    .line 61
    .local v12, "rights":Lcom/einmalfel/earl/AtomText;
    const/4 v13, 0x0

    .line 62
    .local v13, "subtitle":Lcom/einmalfel/earl/AtomText;
    const/16 v17, 0x0

    .line 63
    .local v17, "id":Ljava/lang/String;
    const/4 v10, 0x0

    .line 64
    .local v10, "icon":Ljava/net/URI;
    const/4 v11, 0x0

    .line 65
    .local v11, "logo":Ljava/net/URI;
    const/4 v6, 0x0

    .line 67
    .local v6, "updated":Lcom/einmalfel/earl/AtomDate;
    new-instance v3, Lcom/einmalfel/earl/AtomCommonAttributes;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 68
    .local v3, "atomCommonAttributes":Lcom/einmalfel/earl/AtomCommonAttributes;
    :goto_34
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v2

    const/4 v4, 0x2

    if-ne v2, v4, :cond_1bd

    const/4 v2, 0x1

    move/from16 v0, p1

    if-lt v0, v2, :cond_48

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v2

    move/from16 v0, p1

    if-ge v2, v0, :cond_1bd

    .line 69
    :cond_48
    const-string v2, "http://www.w3.org/2005/Atom"

    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_198

    .line 70
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v18

    .line 71
    .local v18, "tagName":Ljava/lang/String;
    const/4 v2, -0x1

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_1f4

    :cond_60
    :goto_60
    packed-switch v2, :pswitch_data_22a

    .line 112
    const-string v2, "Earl.AtomFeed"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Unknown Atom feed tag "

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 119
    .end local v18    # "tagName":Ljava/lang/String;
    :goto_86
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_34

    .line 71
    .restart local v18    # "tagName":Ljava/lang/String;
    :sswitch_8a
    const-string v4, "entry"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/4 v2, 0x0

    goto :goto_60

    :sswitch_96
    const-string v4, "contributor"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/4 v2, 0x1

    goto :goto_60

    :sswitch_a2
    const-string v4, "author"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/4 v2, 0x2

    goto :goto_60

    :sswitch_ae
    const-string v4, "link"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/4 v2, 0x3

    goto :goto_60

    :sswitch_ba
    const-string v4, "category"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/4 v2, 0x4

    goto :goto_60

    :sswitch_c6
    const-string v4, "generator"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/4 v2, 0x5

    goto :goto_60

    :sswitch_d2
    const-string v4, "title"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/4 v2, 0x6

    goto :goto_60

    :sswitch_de
    const-string v4, "rights"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/4 v2, 0x7

    goto/16 :goto_60

    :sswitch_eb
    const-string v4, "subtitle"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/16 v2, 0x8

    goto/16 :goto_60

    :sswitch_f9
    const-string v4, "id"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/16 v2, 0x9

    goto/16 :goto_60

    :sswitch_107
    const-string v4, "icon"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/16 v2, 0xa

    goto/16 :goto_60

    :sswitch_115
    const-string v4, "logo"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/16 v2, 0xb

    goto/16 :goto_60

    :sswitch_123
    const-string v4, "updated"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    const/16 v2, 0xc

    goto/16 :goto_60

    .line 73
    :pswitch_131
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomEntry;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomEntry;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_86

    .line 76
    :pswitch_13c
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomPerson;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomPerson;

    move-result-object v2

    invoke-interface {v8, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_86

    .line 79
    :pswitch_145
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomPerson;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomPerson;

    move-result-object v2

    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_86

    .line 82
    :pswitch_14e
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomLink;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomLink;

    move-result-object v2

    invoke-interface {v14, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_86

    .line 85
    :pswitch_157
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomCategory;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomCategory;

    move-result-object v2

    invoke-interface {v15, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_86

    .line 88
    :pswitch_160
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomGenerator;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomGenerator;

    move-result-object v9

    .line 89
    goto/16 :goto_86

    .line 91
    :pswitch_166
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomText;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomText;

    move-result-object v5

    .line 92
    goto/16 :goto_86

    .line 94
    :pswitch_16c
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomText;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomText;

    move-result-object v12

    .line 95
    goto/16 :goto_86

    .line 97
    :pswitch_172
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomText;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomText;

    move-result-object v13

    .line 98
    goto/16 :goto_86

    .line 100
    :pswitch_178
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v17

    .line 101
    goto/16 :goto_86

    .line 103
    :pswitch_17e
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->tryParseUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v10

    .line 104
    goto/16 :goto_86

    .line 106
    :pswitch_188
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->tryParseUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v11

    .line 107
    goto/16 :goto_86

    .line 109
    :pswitch_192
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/AtomDate;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomDate;

    move-result-object v6

    .line 110
    goto/16 :goto_86

    .line 116
    .end local v18    # "tagName":Ljava/lang/String;
    :cond_198
    const-string v2, "Earl.AtomFeed"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Unknown Atom feed extension "

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_86

    .line 122
    :cond_1bd
    if-nez v5, :cond_1d1

    .line 123
    const-string v2, "Earl.AtomFeed"

    const-string v4, "Missing title tag in atom feed, replacing with empty string"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    new-instance v5, Lcom/einmalfel/earl/AtomText;

    .end local v5    # "title":Lcom/einmalfel/earl/AtomText;
    const/4 v2, 0x0

    const/4 v4, 0x0

    const-string v19, ""

    move-object/from16 v0, v19

    invoke-direct {v5, v2, v4, v0}, Lcom/einmalfel/earl/AtomText;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .restart local v5    # "title":Lcom/einmalfel/earl/AtomText;
    :cond_1d1
    if-nez v6, :cond_1e9

    .line 127
    const-string v2, "Earl.AtomFeed"

    const-string v4, "Missing title tag in atom feed, replacing with empty string"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    new-instance v6, Lcom/einmalfel/earl/AtomDate;

    .end local v6    # "updated":Lcom/einmalfel/earl/AtomDate;
    const/4 v2, 0x0

    new-instance v4, Ljava/util/Date;

    const-wide/16 v19, 0x0

    move-wide/from16 v0, v19

    invoke-direct {v4, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-direct {v6, v2, v4}, Lcom/einmalfel/earl/AtomDate;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/util/Date;)V

    .line 130
    .restart local v6    # "updated":Lcom/einmalfel/earl/AtomDate;
    :cond_1e9
    new-instance v2, Lcom/einmalfel/earl/AtomFeed;

    .line 131
    invoke-static/range {v17 .. v17}, Lcom/einmalfel/earl/Utils;->nonNullUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v4

    invoke-direct/range {v2 .. v16}, Lcom/einmalfel/earl/AtomFeed;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/net/URI;Lcom/einmalfel/earl/AtomText;Lcom/einmalfel/earl/AtomDate;Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/AtomGenerator;Ljava/net/URI;Ljava/net/URI;Lcom/einmalfel/earl/AtomText;Lcom/einmalfel/earl/AtomText;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object v2

    .line 71
    nop

    :sswitch_data_1f4
    .sparse-switch
        -0x7ad0b3e8 -> :sswitch_eb
        -0x70f79f25 -> :sswitch_96
        -0x53d2de75 -> :sswitch_a2
        -0x377f7e29 -> :sswitch_de
        -0xdf91f45 -> :sswitch_123
        0xd1b -> :sswitch_f9
        0x313c79 -> :sswitch_107
        0x32affa -> :sswitch_ae
        0x32c5ab -> :sswitch_115
        0x302bcfe -> :sswitch_ba
        0x5c30872 -> :sswitch_8a
        0x6942258 -> :sswitch_d2
        0x111a9ad3 -> :sswitch_c6
    .end sparse-switch

    :pswitch_data_22a
    .packed-switch 0x0
        :pswitch_131
        :pswitch_13c
        :pswitch_145
        :pswitch_14e
        :pswitch_157
        :pswitch_160
        :pswitch_166
        :pswitch_16c
        :pswitch_172
        :pswitch_178
        :pswitch_17e
        :pswitch_188
        :pswitch_192
    .end packed-switch
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .registers 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 220
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->authors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 221
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->contributors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13

    const/4 v0, 0x0

    .line 223
    :goto_12
    return-object v0

    .line 221
    :cond_13
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->contributors:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomPerson;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomPerson;->name:Ljava/lang/String;

    goto :goto_12

    .line 223
    :cond_1e
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->authors:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomPerson;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomPerson;->name:Ljava/lang/String;

    goto :goto_12
.end method

.method public getCopyright()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 208
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->rights:Lcom/einmalfel/earl/AtomText;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->rights:Lcom/einmalfel/earl/AtomText;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomText;->value:Ljava/lang/String;

    goto :goto_5
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 202
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->subtitle:Lcom/einmalfel/earl/AtomText;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->subtitle:Lcom/einmalfel/earl/AtomText;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomText;->value:Ljava/lang/String;

    goto :goto_5
.end method

.method public getImageLink()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 214
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->logo:Ljava/net/URI;

    if-nez v0, :cond_11

    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->icon:Ljava/net/URI;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->icon:Ljava/net/URI;

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    :cond_11
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->logo:Ljava/net/URI;

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_9
.end method

.method public getItems()Ljava/util/List;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/einmalfel/earl/Item;",
            ">;"
        }
    .end annotation

    .prologue
    .line 230
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->entries:Ljava/util/List;

    return-object v0
.end method

.method public getLink()Ljava/lang/String;
    .registers 5
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 161
    iget-object v1, p0, Lcom/einmalfel/earl/AtomFeed;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 162
    const/4 v1, 0x0

    .line 184
    :goto_9
    return-object v1

    .line 164
    :cond_a
    iget-object v1, p0, Lcom/einmalfel/earl/AtomFeed;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_31

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomLink;

    .line 165
    .local v0, "link":Lcom/einmalfel/earl/AtomLink;
    iget-object v2, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    if-eqz v2, :cond_10

    const-string v2, "alternate"

    iget-object v3, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 166
    iget-object v1, v0, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    .line 168
    .end local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    :cond_31
    iget-object v1, p0, Lcom/einmalfel/earl/AtomFeed;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_37
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_58

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomLink;

    .line 169
    .restart local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    iget-object v2, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    if-eqz v2, :cond_37

    const-string v2, "via"

    iget-object v3, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37

    .line 170
    iget-object v1, v0, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    .line 172
    .end local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    :cond_58
    iget-object v1, p0, Lcom/einmalfel/earl/AtomFeed;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_5e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomLink;

    .line 173
    .restart local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    iget-object v2, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    if-eqz v2, :cond_5e

    const-string v2, "related"

    iget-object v3, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 174
    iget-object v1, v0, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    .line 176
    .end local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    :cond_7f
    iget-object v1, p0, Lcom/einmalfel/earl/AtomFeed;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_85
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomLink;

    .line 177
    .restart local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    iget-object v2, v0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    if-nez v2, :cond_85

    .line 178
    iget-object v1, v0, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_9

    .line 180
    .end local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    :cond_9d
    iget-object v1, p0, Lcom/einmalfel/earl/AtomFeed;->links:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_cf

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/AtomLink;

    .line 181
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

    .line 182
    iget-object v1, v0, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_9

    .line 184
    .end local v0    # "link":Lcom/einmalfel/earl/AtomLink;
    :cond_cf
    iget-object v1, p0, Lcom/einmalfel/earl/AtomFeed;->links:Ljava/util/List;

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
    .line 190
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->updated:Lcom/einmalfel/earl/AtomDate;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomDate;->date:Ljava/util/Date;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 196
    iget-object v0, p0, Lcom/einmalfel/earl/AtomFeed;->title:Lcom/einmalfel/earl/AtomText;

    iget-object v0, v0, Lcom/einmalfel/earl/AtomText;->value:Ljava/lang/String;

    return-object v0
.end method
