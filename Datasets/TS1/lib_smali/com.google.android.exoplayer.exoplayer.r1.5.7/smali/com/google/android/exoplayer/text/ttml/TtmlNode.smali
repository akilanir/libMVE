.class final Lcom/google/android/exoplayer/text/ttml/TtmlNode;
.super Ljava/lang/Object;
.source "TtmlNode.java"


# static fields
.field public static final ATTR_ID:Ljava/lang/String; = "id"

.field public static final ATTR_TTS_BACKGROUND_COLOR:Ljava/lang/String; = "backgroundColor"

.field public static final ATTR_TTS_COLOR:Ljava/lang/String; = "color"

.field public static final ATTR_TTS_FONT_FAMILY:Ljava/lang/String; = "fontFamily"

.field public static final ATTR_TTS_FONT_SIZE:Ljava/lang/String; = "fontSize"

.field public static final ATTR_TTS_FONT_STYLE:Ljava/lang/String; = "fontStyle"

.field public static final ATTR_TTS_FONT_WEIGHT:Ljava/lang/String; = "fontWeight"

.field public static final ATTR_TTS_TEXT_ALIGN:Ljava/lang/String; = "textAlign"

.field public static final ATTR_TTS_TEXT_DECORATION:Ljava/lang/String; = "textDecoration"

.field public static final BOLD:Ljava/lang/String; = "bold"

.field public static final CENTER:Ljava/lang/String; = "center"

.field public static final END:Ljava/lang/String; = "end"

.field public static final ITALIC:Ljava/lang/String; = "italic"

.field public static final LEFT:Ljava/lang/String; = "left"

.field public static final LINETHROUGH:Ljava/lang/String; = "linethrough"

.field public static final NO_LINETHROUGH:Ljava/lang/String; = "nolinethrough"

.field public static final NO_UNDERLINE:Ljava/lang/String; = "nounderline"

.field public static final RIGHT:Ljava/lang/String; = "right"

.field public static final START:Ljava/lang/String; = "start"

.field public static final TAG_BODY:Ljava/lang/String; = "body"

.field public static final TAG_BR:Ljava/lang/String; = "br"

.field public static final TAG_DIV:Ljava/lang/String; = "div"

.field public static final TAG_HEAD:Ljava/lang/String; = "head"

.field public static final TAG_LAYOUT:Ljava/lang/String; = "layout"

.field public static final TAG_METADATA:Ljava/lang/String; = "metadata"

.field public static final TAG_P:Ljava/lang/String; = "p"

.field public static final TAG_REGION:Ljava/lang/String; = "region"

.field public static final TAG_SMPTE_DATA:Ljava/lang/String; = "smpte:data"

.field public static final TAG_SMPTE_IMAGE:Ljava/lang/String; = "smpte:image"

.field public static final TAG_SMPTE_INFORMATION:Ljava/lang/String; = "smpte:information"

.field public static final TAG_SPAN:Ljava/lang/String; = "span"

.field public static final TAG_STYLE:Ljava/lang/String; = "style"

.field public static final TAG_STYLING:Ljava/lang/String; = "styling"

.field public static final TAG_TT:Ljava/lang/String; = "tt"

.field public static final UNDEFINED_TIME:J = -0x1L

.field public static final UNDERLINE:Ljava/lang/String; = "underline"


# instance fields
.field private children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/text/ttml/TtmlNode;",
            ">;"
        }
    .end annotation
.end field

.field private end:I

.field public final endTimeUs:J

.field public final isTextNode:Z

.field private start:I

.field public final startTimeUs:J

.field public final style:Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

.field private styleIds:[Ljava/lang/String;

.field public final tag:Ljava/lang/String;

.field public final text:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;JJLcom/google/android/exoplayer/text/ttml/TtmlStyle;[Ljava/lang/String;)V
    .registers 10
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "startTimeUs"    # J
    .param p5, "endTimeUs"    # J
    .param p7, "style"    # Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    .param p8, "styleIds"    # [Ljava/lang/String;

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput-object p1, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->tag:Ljava/lang/String;

    .line 96
    iput-object p2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->text:Ljava/lang/String;

    .line 97
    iput-object p7, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->style:Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    .line 98
    iput-object p8, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->styleIds:[Ljava/lang/String;

    .line 99
    if-eqz p2, :cond_15

    const/4 v0, 0x1

    :goto_e
    iput-boolean v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->isTextNode:Z

    .line 100
    iput-wide p3, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    .line 101
    iput-wide p5, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    .line 102
    return-void

    .line 99
    :cond_15
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public static buildNode(Ljava/lang/String;JJLcom/google/android/exoplayer/text/ttml/TtmlStyle;[Ljava/lang/String;)Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .registers 16
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "startTimeUs"    # J
    .param p3, "endTimeUs"    # J
    .param p5, "style"    # Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    .param p6, "styleIds"    # [Ljava/lang/String;

    .prologue
    .line 90
    new-instance v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    const/4 v2, 0x0

    move-object v1, p0

    move-wide v3, p1

    move-wide v5, p3

    move-object v7, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;-><init>(Ljava/lang/String;Ljava/lang/String;JJLcom/google/android/exoplayer/text/ttml/TtmlStyle;[Ljava/lang/String;)V

    return-object v0
.end method

.method public static buildTextNode(Ljava/lang/String;)Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .registers 10
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    const-wide/16 v3, -0x1

    const/4 v1, 0x0

    .line 84
    new-instance v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    invoke-static {p0}, Lcom/google/android/exoplayer/text/ttml/TtmlRenderUtil;->applyTextElementSpacePolicy(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-wide v5, v3

    move-object v7, v1

    move-object v8, v1

    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;-><init>(Ljava/lang/String;Ljava/lang/String;JJLcom/google/android/exoplayer/text/ttml/TtmlStyle;[Ljava/lang/String;)V

    return-object v0
.end method

.method private getEventTimes(Ljava/util/TreeSet;Z)V
    .registers 9
    .param p2, "descendsPNode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeSet",
            "<",
            "Ljava/lang/Long;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p1, "out":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Long;>;"
    const-wide/16 v4, -0x1

    .line 143
    const-string v2, "p"

    iget-object v3, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->tag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 144
    .local v1, "isPNode":Z
    if-nez p2, :cond_e

    if-eqz v1, :cond_2c

    .line 145
    :cond_e
    iget-wide v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1d

    .line 146
    iget-wide v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 148
    :cond_1d
    iget-wide v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2c

    .line 149
    iget-wide v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 152
    :cond_2c
    iget-object v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    if-nez v2, :cond_31

    .line 158
    :cond_30
    return-void

    .line 155
    :cond_31
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_32
    iget-object v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_30

    .line 156
    iget-object v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    if-nez p2, :cond_46

    if-eqz v1, :cond_4d

    :cond_46
    const/4 v3, 0x1

    :goto_47
    invoke-direct {v2, p1, v3}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->getEventTimes(Ljava/util/TreeSet;Z)V

    .line 155
    add-int/lit8 v0, v0, 0x1

    goto :goto_32

    .line 156
    :cond_4d
    const/4 v3, 0x0

    goto :goto_47
.end method

.method private traverseForStyle(Landroid/text/SpannableStringBuilder;Ljava/util/Map;)V
    .registers 7
    .param p1, "builder"    # Landroid/text/SpannableStringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/SpannableStringBuilder;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer/text/ttml/TtmlStyle;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 240
    .local p2, "globalStyles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;>;"
    iget v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->start:I

    iget v3, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->end:I

    if-eq v2, v3, :cond_28

    .line 241
    iget-object v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->style:Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    iget-object v3, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->styleIds:[Ljava/lang/String;

    invoke-static {v2, v3, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlRenderUtil;->resolveStyle(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;[Ljava/lang/String;Ljava/util/Map;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v1

    .line 242
    .local v1, "resolvedStyle":Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    if-eqz v1, :cond_17

    .line 243
    iget v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->start:I

    iget v3, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->end:I

    invoke-static {p1, v2, v3, v1}, Lcom/google/android/exoplayer/text/ttml/TtmlRenderUtil;->applyStylesToSpan(Landroid/text/SpannableStringBuilder;IILcom/google/android/exoplayer/text/ttml/TtmlStyle;)V

    .line 245
    :cond_17
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_18
    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_28

    .line 246
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->getChild(I)Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    move-result-object v2

    invoke-direct {v2, p1, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->traverseForStyle(Landroid/text/SpannableStringBuilder;Ljava/util/Map;)V

    .line 245
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 249
    .end local v0    # "i":I
    .end local v1    # "resolvedStyle":Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    :cond_28
    return-void
.end method

.method private traverseForText(JLandroid/text/SpannableStringBuilder;Z)Landroid/text/SpannableStringBuilder;
    .registers 9
    .param p1, "timeUs"    # J
    .param p3, "builder"    # Landroid/text/SpannableStringBuilder;
    .param p4, "descendsPNode"    # Z

    .prologue
    .line 217
    invoke-virtual {p3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    iput v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->start:I

    .line 218
    iget v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->start:I

    iput v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->end:I

    .line 219
    iget-boolean v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->isTextNode:Z

    if-eqz v2, :cond_16

    if-eqz p4, :cond_16

    .line 220
    iget-object v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->text:Ljava/lang/String;

    invoke-virtual {p3, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 235
    :cond_15
    :goto_15
    return-object p3

    .line 221
    :cond_16
    const-string v2, "br"

    iget-object v3, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->tag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_28

    if-eqz p4, :cond_28

    .line 222
    const/16 v2, 0xa

    invoke-virtual {p3, v2}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto :goto_15

    .line 223
    :cond_28
    const-string v2, "metadata"

    iget-object v3, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->tag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_15

    .line 225
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->isActive(J)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 226
    const-string v2, "p"

    iget-object v3, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->tag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 227
    .local v1, "isPNode":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_41
    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_58

    .line 228
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->getChild(I)Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    move-result-object v3

    if-nez p4, :cond_4f

    if-eqz v1, :cond_56

    :cond_4f
    const/4 v2, 0x1

    :goto_50
    invoke-direct {v3, p1, p2, p3, v2}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->traverseForText(JLandroid/text/SpannableStringBuilder;Z)Landroid/text/SpannableStringBuilder;

    .line 227
    add-int/lit8 v0, v0, 0x1

    goto :goto_41

    .line 228
    :cond_56
    const/4 v2, 0x0

    goto :goto_50

    .line 230
    :cond_58
    if-eqz v1, :cond_5d

    .line 231
    invoke-static {p3}, Lcom/google/android/exoplayer/text/ttml/TtmlRenderUtil;->endParagraph(Landroid/text/SpannableStringBuilder;)V

    .line 233
    :cond_5d
    invoke-virtual {p3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    iput v2, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->end:I

    goto :goto_15
.end method


# virtual methods
.method public addChild(Lcom/google/android/exoplayer/text/ttml/TtmlNode;)V
    .registers 3
    .param p1, "child"    # Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    if-nez v0, :cond_b

    .line 113
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    .line 115
    :cond_b
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    return-void
.end method

.method public getChild(I)Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 119
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    if-nez v0, :cond_a

    .line 120
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 122
    :cond_a
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    return-object v0
.end method

.method public getChildCount()I
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->children:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_5
.end method

.method public getEventTimesUs()[J
    .registers 9

    .prologue
    .line 130
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    .line 131
    .local v1, "eventTimeSet":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Long;>;"
    const/4 v7, 0x0

    invoke-direct {p0, v1, v7}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->getEventTimes(Ljava/util/TreeSet;Z)V

    .line 132
    invoke-virtual {v1}, Ljava/util/TreeSet;->size()I

    move-result v7

    new-array v4, v7, [J

    .line 133
    .local v4, "eventTimes":[J
    invoke-virtual {v1}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 134
    .local v0, "eventTimeIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Long;>;"
    const/4 v5, 0x0

    .line 135
    .local v5, "i":I
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2a

    .line 136
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 137
    .local v2, "eventTimeUs":J
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "i":I
    .local v6, "i":I
    aput-wide v2, v4, v5

    move v5, v6

    .line 138
    .end local v6    # "i":I
    .restart local v5    # "i":I
    goto :goto_14

    .line 139
    .end local v2    # "eventTimeUs":J
    :cond_2a
    return-object v4
.end method

.method public getStyleIds()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->styleIds:[Ljava/lang/String;

    return-object v0
.end method

.method public getText(JLjava/util/Map;)Ljava/lang/CharSequence;
    .registers 13
    .param p1, "timeUs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer/text/ttml/TtmlStyle;",
            ">;)",
            "Ljava/lang/CharSequence;"
        }
    .end annotation

    .prologue
    .local p3, "globalStyles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;>;"
    const/16 v8, 0xa

    const/4 v6, 0x0

    const/16 v7, 0x20

    .line 165
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 166
    .local v0, "builder":Landroid/text/SpannableStringBuilder;
    invoke-direct {p0, p1, p2, v0, v6}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->traverseForText(JLandroid/text/SpannableStringBuilder;Z)Landroid/text/SpannableStringBuilder;

    .line 167
    invoke-direct {p0, v0, p3}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->traverseForStyle(Landroid/text/SpannableStringBuilder;Ljava/util/Map;)V

    .line 170
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    .line 171
    .local v1, "builderLength":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_15
    if-ge v2, v1, :cond_3d

    .line 172
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v7, :cond_3a

    .line 173
    add-int/lit8 v3, v2, 0x1

    .line 174
    .local v3, "j":I
    :goto_1f
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    if-ge v3, v5, :cond_2e

    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v7, :cond_2e

    .line 175
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 177
    :cond_2e
    add-int/lit8 v5, v2, 0x1

    sub-int v4, v3, v5

    .line 178
    .local v4, "spacesToDelete":I
    if-lez v4, :cond_3a

    .line 179
    add-int v5, v2, v4

    invoke-virtual {v0, v2, v5}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 180
    sub-int/2addr v1, v4

    .line 171
    .end local v3    # "j":I
    .end local v4    # "spacesToDelete":I
    :cond_3a
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 185
    :cond_3d
    if-lez v1, :cond_4b

    invoke-virtual {v0, v6}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v7, :cond_4b

    .line 186
    const/4 v5, 0x1

    invoke-virtual {v0, v6, v5}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 187
    add-int/lit8 v1, v1, -0x1

    .line 189
    :cond_4b
    const/4 v2, 0x0

    :goto_4c
    add-int/lit8 v5, v1, -0x1

    if-ge v2, v5, :cond_6a

    .line 190
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v8, :cond_67

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v7, :cond_67

    .line 191
    add-int/lit8 v5, v2, 0x1

    add-int/lit8 v6, v2, 0x2

    invoke-virtual {v0, v5, v6}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 192
    add-int/lit8 v1, v1, -0x1

    .line 189
    :cond_67
    add-int/lit8 v2, v2, 0x1

    goto :goto_4c

    .line 196
    :cond_6a
    if-lez v1, :cond_7b

    add-int/lit8 v5, v1, -0x1

    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v7, :cond_7b

    .line 197
    add-int/lit8 v5, v1, -0x1

    invoke-virtual {v0, v5, v1}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 198
    add-int/lit8 v1, v1, -0x1

    .line 200
    :cond_7b
    const/4 v2, 0x0

    :goto_7c
    add-int/lit8 v5, v1, -0x1

    if-ge v2, v5, :cond_98

    .line 201
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v7, :cond_95

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v8, :cond_95

    .line 202
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v0, v2, v5}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 203
    add-int/lit8 v1, v1, -0x1

    .line 200
    :cond_95
    add-int/lit8 v2, v2, 0x1

    goto :goto_7c

    .line 207
    :cond_98
    if-lez v1, :cond_a7

    add-int/lit8 v5, v1, -0x1

    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v5

    if-ne v5, v8, :cond_a7

    .line 208
    add-int/lit8 v5, v1, -0x1

    invoke-virtual {v0, v5, v1}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 212
    :cond_a7
    return-object v0
.end method

.method public isActive(J)Z
    .registers 7
    .param p1, "timeUs"    # J

    .prologue
    const-wide/16 v2, -0x1

    .line 105
    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_e

    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_32

    :cond_e
    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    cmp-long v0, v0, p1

    if-gtz v0, :cond_1a

    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_32

    :cond_1a
    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_26

    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_32

    :cond_26
    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    cmp-long v0, v0, p1

    if-gtz v0, :cond_34

    iget-wide v0, p0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    cmp-long v0, p1, v0

    if-gez v0, :cond_34

    :cond_32
    const/4 v0, 0x1

    :goto_33
    return v0

    :cond_34
    const/4 v0, 0x0

    goto :goto_33
.end method
