.class Lorg/simpleframework/xml/stream/PullReader;
.super Ljava/lang/Object;
.source "PullReader.java"

# interfaces
.implements Lorg/simpleframework/xml/stream/EventReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/simpleframework/xml/stream/PullReader$1;,
        Lorg/simpleframework/xml/stream/PullReader$End;,
        Lorg/simpleframework/xml/stream/PullReader$Text;,
        Lorg/simpleframework/xml/stream/PullReader$Start;,
        Lorg/simpleframework/xml/stream/PullReader$Entry;
    }
.end annotation


# instance fields
.field private parser:Lorg/xmlpull/v1/XmlPullParser;

.field private peek:Lorg/simpleframework/xml/stream/EventNode;


# direct methods
.method public constructor <init>(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 2
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lorg/simpleframework/xml/stream/PullReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    .line 60
    return-void
.end method

.method private attribute(I)Lorg/simpleframework/xml/stream/PullReader$Entry;
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 186
    new-instance v0, Lorg/simpleframework/xml/stream/PullReader$Entry;

    iget-object v1, p0, Lorg/simpleframework/xml/stream/PullReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-direct {v0, v1, p1}, Lorg/simpleframework/xml/stream/PullReader$Entry;-><init>(Lorg/xmlpull/v1/XmlPullParser;I)V

    return-object v0
.end method

.method private build(Lorg/simpleframework/xml/stream/PullReader$Start;)Lorg/simpleframework/xml/stream/PullReader$Start;
    .registers 6
    .param p1, "event"    # Lorg/simpleframework/xml/stream/PullReader$Start;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 163
    iget-object v3, p0, Lorg/simpleframework/xml/stream/PullReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v0

    .line 165
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v0, :cond_19

    .line 166
    invoke-direct {p0, v2}, Lorg/simpleframework/xml/stream/PullReader;->attribute(I)Lorg/simpleframework/xml/stream/PullReader$Entry;

    move-result-object v1

    .line 168
    .local v1, "entry":Lorg/simpleframework/xml/stream/PullReader$Entry;
    invoke-virtual {v1}, Lorg/simpleframework/xml/stream/PullReader$Entry;->isReserved()Z

    move-result v3

    if-nez v3, :cond_16

    .line 169
    invoke-virtual {p1, v1}, Lorg/simpleframework/xml/stream/PullReader$Start;->add(Ljava/lang/Object;)Z

    .line 165
    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 172
    .end local v1    # "entry":Lorg/simpleframework/xml/stream/PullReader$Entry;
    :cond_19
    return-object p1
.end method

.method private end()Lorg/simpleframework/xml/stream/PullReader$End;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 199
    new-instance v0, Lorg/simpleframework/xml/stream/PullReader$End;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/simpleframework/xml/stream/PullReader$End;-><init>(Lorg/simpleframework/xml/stream/PullReader$1;)V

    return-object v0
.end method

.method private read()Lorg/simpleframework/xml/stream/EventNode;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 105
    iget-object v1, p0, Lorg/simpleframework/xml/stream/PullReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 107
    .local v0, "event":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_26

    .line 108
    const/4 v1, 0x2

    if-ne v0, v1, :cond_11

    .line 109
    invoke-direct {p0}, Lorg/simpleframework/xml/stream/PullReader;->start()Lorg/simpleframework/xml/stream/PullReader$Start;

    move-result-object v1

    .line 119
    :goto_10
    return-object v1

    .line 111
    :cond_11
    const/4 v1, 0x4

    if-ne v0, v1, :cond_19

    .line 112
    invoke-direct {p0}, Lorg/simpleframework/xml/stream/PullReader;->text()Lorg/simpleframework/xml/stream/PullReader$Text;

    move-result-object v1

    goto :goto_10

    .line 114
    :cond_19
    const/4 v1, 0x3

    if-ne v0, v1, :cond_21

    .line 115
    invoke-direct {p0}, Lorg/simpleframework/xml/stream/PullReader;->end()Lorg/simpleframework/xml/stream/PullReader$End;

    move-result-object v1

    goto :goto_10

    .line 117
    :cond_21
    invoke-direct {p0}, Lorg/simpleframework/xml/stream/PullReader;->read()Lorg/simpleframework/xml/stream/EventNode;

    move-result-object v1

    goto :goto_10

    .line 119
    :cond_26
    const/4 v1, 0x0

    goto :goto_10
.end method

.method private start()Lorg/simpleframework/xml/stream/PullReader$Start;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 143
    new-instance v0, Lorg/simpleframework/xml/stream/PullReader$Start;

    iget-object v1, p0, Lorg/simpleframework/xml/stream/PullReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-direct {v0, v1}, Lorg/simpleframework/xml/stream/PullReader$Start;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 145
    .local v0, "event":Lorg/simpleframework/xml/stream/PullReader$Start;
    invoke-virtual {v0}, Lorg/simpleframework/xml/stream/PullReader$Start;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 146
    invoke-direct {p0, v0}, Lorg/simpleframework/xml/stream/PullReader;->build(Lorg/simpleframework/xml/stream/PullReader$Start;)Lorg/simpleframework/xml/stream/PullReader$Start;

    move-result-object v0

    .line 148
    .end local v0    # "event":Lorg/simpleframework/xml/stream/PullReader$Start;
    :cond_11
    return-object v0
.end method

.method private text()Lorg/simpleframework/xml/stream/PullReader$Text;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 131
    new-instance v0, Lorg/simpleframework/xml/stream/PullReader$Text;

    iget-object v1, p0, Lorg/simpleframework/xml/stream/PullReader;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-direct {v0, v1}, Lorg/simpleframework/xml/stream/PullReader$Text;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    return-object v0
.end method


# virtual methods
.method public next()Lorg/simpleframework/xml/stream/EventNode;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lorg/simpleframework/xml/stream/PullReader;->peek:Lorg/simpleframework/xml/stream/EventNode;

    .line 88
    .local v0, "next":Lorg/simpleframework/xml/stream/EventNode;
    if-nez v0, :cond_9

    .line 89
    invoke-direct {p0}, Lorg/simpleframework/xml/stream/PullReader;->read()Lorg/simpleframework/xml/stream/EventNode;

    move-result-object v0

    .line 93
    :goto_8
    return-object v0

    .line 91
    :cond_9
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/simpleframework/xml/stream/PullReader;->peek:Lorg/simpleframework/xml/stream/EventNode;

    goto :goto_8
.end method

.method public peek()Lorg/simpleframework/xml/stream/EventNode;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Lorg/simpleframework/xml/stream/PullReader;->peek:Lorg/simpleframework/xml/stream/EventNode;

    if-nez v0, :cond_a

    .line 72
    invoke-virtual {p0}, Lorg/simpleframework/xml/stream/PullReader;->next()Lorg/simpleframework/xml/stream/EventNode;

    move-result-object v0

    iput-object v0, p0, Lorg/simpleframework/xml/stream/PullReader;->peek:Lorg/simpleframework/xml/stream/EventNode;

    .line 74
    :cond_a
    iget-object v0, p0, Lorg/simpleframework/xml/stream/PullReader;->peek:Lorg/simpleframework/xml/stream/EventNode;

    return-object v0
.end method
