.class public Lcom/nineoldandroids/animation/AnimatorInflater;
.super Ljava/lang/Object;
.source "AnimatorInflater.java"


# static fields
.field private static final Animator:[I

.field private static final AnimatorSet:[I

.field private static final AnimatorSet_ordering:I = 0x0

.field private static final Animator_duration:I = 0x1

.field private static final Animator_interpolator:I = 0x0

.field private static final Animator_repeatCount:I = 0x3

.field private static final Animator_repeatMode:I = 0x4

.field private static final Animator_startOffset:I = 0x2

.field private static final Animator_valueFrom:I = 0x5

.field private static final Animator_valueTo:I = 0x6

.field private static final Animator_valueType:I = 0x7

.field private static final PropertyAnimator:[I

.field private static final PropertyAnimator_propertyName:I

.field private static final TOGETHER:I

.field private static final VALUE_TYPE_FLOAT:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 43
    new-array v0, v3, [I

    const v1, 0x10102e2

    aput v1, v0, v2

    sput-object v0, Lcom/nineoldandroids/animation/AnimatorInflater;->AnimatorSet:[I

    .line 48
    new-array v0, v3, [I

    const v1, 0x10102e1

    aput v1, v0, v2

    sput-object v0, Lcom/nineoldandroids/animation/AnimatorInflater;->PropertyAnimator:[I

    .line 53
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_1e

    sput-object v0, Lcom/nineoldandroids/animation/AnimatorInflater;->Animator:[I

    return-void

    :array_1e
    .array-data 4
        0x1010141
        0x1010198
        0x10101be
        0x10101bf
        0x10101c0
        0x10102de
        0x10102df
        0x10102e0
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createAnimatorFromXml(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)Lcom/nineoldandroids/animation/Animator;
    .registers 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    invoke-static {p1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v0, v1, v2}, Lcom/nineoldandroids/animation/AnimatorInflater;->createAnimatorFromXml(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Lcom/nineoldandroids/animation/AnimatorSet;I)Lcom/nineoldandroids/animation/Animator;

    move-result-object v0

    return-object v0
.end method

.method private static createAnimatorFromXml(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Lcom/nineoldandroids/animation/AnimatorSet;I)Lcom/nineoldandroids/animation/Animator;
    .registers 23
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "parent"    # Lcom/nineoldandroids/animation/AnimatorSet;
    .param p4, "sequenceOrdering"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    const/4 v4, 0x0

    .line 129
    .local v4, "anim":Lcom/nineoldandroids/animation/Animator;
    const/4 v6, 0x0

    .line 133
    .local v6, "childAnims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator;>;"
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v7

    .line 136
    .local v7, "depth":I
    :cond_6
    :goto_6
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v14

    .local v14, "type":I
    const/4 v15, 0x3

    if-ne v14, v15, :cond_13

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v15

    if-le v15, v7, :cond_a5

    :cond_13
    const/4 v15, 0x1

    if-eq v14, v15, :cond_a5

    .line 138
    const/4 v15, 0x2

    if-ne v14, v15, :cond_6

    .line 142
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    .line 144
    .local v11, "name":Ljava/lang/String;
    const-string v15, "objectAnimator"

    invoke-virtual {v11, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3a

    .line 145
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lcom/nineoldandroids/animation/AnimatorInflater;->loadObjectAnimator(Landroid/content/Context;Landroid/util/AttributeSet;)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v4

    .line 163
    :goto_2d
    if-eqz p3, :cond_6

    .line 164
    if-nez v6, :cond_36

    .line 165
    new-instance v6, Ljava/util/ArrayList;

    .end local v6    # "childAnims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator;>;"
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 167
    .restart local v6    # "childAnims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator;>;"
    :cond_36
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 146
    :cond_3a
    const-string v15, "animator"

    invoke-virtual {v11, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_4c

    .line 147
    const/4 v15, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1, v15}, Lcom/nineoldandroids/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/nineoldandroids/animation/ValueAnimator;)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v4

    goto :goto_2d

    .line 148
    :cond_4c
    const-string v15, "set"

    invoke-virtual {v11, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_88

    .line 149
    new-instance v4, Lcom/nineoldandroids/animation/AnimatorSet;

    .end local v4    # "anim":Lcom/nineoldandroids/animation/Animator;
    invoke-direct {v4}, Lcom/nineoldandroids/animation/AnimatorSet;-><init>()V

    .line 150
    .restart local v4    # "anim":Lcom/nineoldandroids/animation/Animator;
    sget-object v15, Lcom/nineoldandroids/animation/AnimatorInflater;->AnimatorSet:[I

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v15}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 153
    .local v3, "a":Landroid/content/res/TypedArray;
    new-instance v13, Landroid/util/TypedValue;

    invoke-direct {v13}, Landroid/util/TypedValue;-><init>()V

    .line 154
    .local v13, "orderingValue":Landroid/util/TypedValue;
    const/4 v15, 0x0

    invoke-virtual {v3, v15, v13}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 155
    iget v15, v13, Landroid/util/TypedValue;->type:I

    const/16 v16, 0x10

    move/from16 v0, v16

    if-ne v15, v0, :cond_86

    iget v12, v13, Landroid/util/TypedValue;->data:I

    .local v12, "ordering":I
    :goto_76
    move-object v15, v4

    .line 157
    check-cast v15, Lcom/nineoldandroids/animation/AnimatorSet;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-static {v0, v1, v2, v15, v12}, Lcom/nineoldandroids/animation/AnimatorInflater;->createAnimatorFromXml(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Lcom/nineoldandroids/animation/AnimatorSet;I)Lcom/nineoldandroids/animation/Animator;

    .line 158
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_2d

    .line 155
    .end local v12    # "ordering":I
    :cond_86
    const/4 v12, 0x0

    goto :goto_76

    .line 160
    .end local v3    # "a":Landroid/content/res/TypedArray;
    .end local v13    # "orderingValue":Landroid/util/TypedValue;
    :cond_88
    new-instance v15, Ljava/lang/RuntimeException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Unknown animator name: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 170
    .end local v11    # "name":Ljava/lang/String;
    :cond_a5
    if-eqz p3, :cond_cd

    if-eqz v6, :cond_cd

    .line 171
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v15

    new-array v5, v15, [Lcom/nineoldandroids/animation/Animator;

    .line 172
    .local v5, "animsArray":[Lcom/nineoldandroids/animation/Animator;
    const/4 v9, 0x0

    .line 173
    .local v9, "index":I
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_b4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_c6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Animator;

    .line 174
    .local v3, "a":Lcom/nineoldandroids/animation/Animator;
    add-int/lit8 v10, v9, 0x1

    .end local v9    # "index":I
    .local v10, "index":I
    aput-object v3, v5, v9

    move v9, v10

    .end local v10    # "index":I
    .restart local v9    # "index":I
    goto :goto_b4

    .line 176
    .end local v3    # "a":Lcom/nineoldandroids/animation/Animator;
    :cond_c6
    if-nez p4, :cond_ce

    .line 177
    move-object/from16 v0, p3

    invoke-virtual {v0, v5}, Lcom/nineoldandroids/animation/AnimatorSet;->playTogether([Lcom/nineoldandroids/animation/Animator;)V

    .line 183
    .end local v5    # "animsArray":[Lcom/nineoldandroids/animation/Animator;
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v9    # "index":I
    :cond_cd
    :goto_cd
    return-object v4

    .line 179
    .restart local v5    # "animsArray":[Lcom/nineoldandroids/animation/Animator;
    .restart local v8    # "i$":Ljava/util/Iterator;
    .restart local v9    # "index":I
    :cond_ce
    move-object/from16 v0, p3

    invoke-virtual {v0, v5}, Lcom/nineoldandroids/animation/AnimatorSet;->playSequentially([Lcom/nineoldandroids/animation/Animator;)V

    goto :goto_cd
.end method

.method public static loadAnimator(Landroid/content/Context;I)Lcom/nineoldandroids/animation/Animator;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 97
    const/4 v1, 0x0

    .line 99
    .local v1, "parser":Landroid/content/res/XmlResourceParser;
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/res/Resources;->getAnimation(I)Landroid/content/res/XmlResourceParser;

    move-result-object v1

    .line 100
    invoke-static {p0, v1}, Lcom/nineoldandroids/animation/AnimatorInflater;->createAnimatorFromXml(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)Lcom/nineoldandroids/animation/Animator;
    :try_end_c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_c} :catch_13
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_c} :catch_3b
    .catchall {:try_start_1 .. :try_end_c} :catchall_34

    move-result-object v3

    .line 114
    if-eqz v1, :cond_12

    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_12
    return-object v3

    .line 101
    :catch_13
    move-exception v0

    .line 102
    .local v0, "ex":Lorg/xmlpull/v1/XmlPullParserException;
    :try_start_14
    new-instance v2, Landroid/content/res/Resources$NotFoundException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Can\'t load animation resource ID #0x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    .line 105
    .local v2, "rnf":Landroid/content/res/Resources$NotFoundException;
    invoke-virtual {v2, v0}, Landroid/content/res/Resources$NotFoundException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 106
    throw v2
    :try_end_34
    .catchall {:try_start_14 .. :try_end_34} :catchall_34

    .line 114
    .end local v0    # "ex":Lorg/xmlpull/v1/XmlPullParserException;
    .end local v2    # "rnf":Landroid/content/res/Resources$NotFoundException;
    :catchall_34
    move-exception v3

    if-eqz v1, :cond_3a

    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_3a
    throw v3

    .line 107
    :catch_3b
    move-exception v0

    .line 108
    .local v0, "ex":Ljava/io/IOException;
    :try_start_3c
    new-instance v2, Landroid/content/res/Resources$NotFoundException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Can\'t load animation resource ID #0x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    .line 111
    .restart local v2    # "rnf":Landroid/content/res/Resources$NotFoundException;
    invoke-virtual {v2, v0}, Landroid/content/res/Resources$NotFoundException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 112
    throw v2
    :try_end_5c
    .catchall {:try_start_3c .. :try_end_5c} :catchall_34
.end method

.method private static loadAnimator(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/nineoldandroids/animation/ValueAnimator;)Lcom/nineoldandroids/animation/ValueAnimator;
    .registers 26
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "anim"    # Lcom/nineoldandroids/animation/ValueAnimator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 216
    sget-object v21, Lcom/nineoldandroids/animation/AnimatorInflater;->Animator:[I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 219
    .local v3, "a":Landroid/content/res/TypedArray;
    const/16 v21, 0x1

    const/16 v22, 0x0

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v21

    move/from16 v0, v21

    int-to-long v4, v0

    .line 221
    .local v4, "duration":J
    const/16 v21, 0x2

    const/16 v22, 0x0

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v21

    move/from16 v0, v21

    int-to-long v11, v0

    .line 223
    .local v11, "startDelay":J
    const/16 v21, 0x7

    const/16 v22, 0x0

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v20

    .line 226
    .local v20, "valueType":I
    if-nez p2, :cond_3d

    .line 227
    new-instance p2, Lcom/nineoldandroids/animation/ValueAnimator;

    .end local p2    # "anim":Lcom/nineoldandroids/animation/ValueAnimator;
    invoke-direct/range {p2 .. p2}, Lcom/nineoldandroids/animation/ValueAnimator;-><init>()V

    .line 231
    .restart local p2    # "anim":Lcom/nineoldandroids/animation/ValueAnimator;
    :cond_3d
    const/16 v17, 0x5

    .line 232
    .local v17, "valueFromIndex":I
    const/16 v19, 0x6

    .line 234
    .local v19, "valueToIndex":I
    if-nez v20, :cond_127

    const/4 v7, 0x1

    .line 236
    .local v7, "getFloats":Z
    :goto_44
    move/from16 v0, v17

    invoke-virtual {v3, v0}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v14

    .line 237
    .local v14, "tvFrom":Landroid/util/TypedValue;
    if-eqz v14, :cond_12a

    const/4 v8, 0x1

    .line 238
    .local v8, "hasFrom":Z
    :goto_4d
    if-eqz v8, :cond_12d

    iget v6, v14, Landroid/util/TypedValue;->type:I

    .line 239
    .local v6, "fromType":I
    :goto_51
    move/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v15

    .line 240
    .local v15, "tvTo":Landroid/util/TypedValue;
    if-eqz v15, :cond_130

    const/4 v9, 0x1

    .line 241
    .local v9, "hasTo":Z
    :goto_5a
    if-eqz v9, :cond_133

    iget v13, v15, Landroid/util/TypedValue;->type:I

    .line 243
    .local v13, "toType":I
    :goto_5e
    if-eqz v8, :cond_6c

    const/16 v21, 0x1c

    move/from16 v0, v21

    if-lt v6, v0, :cond_6c

    const/16 v21, 0x1f

    move/from16 v0, v21

    if-le v6, v0, :cond_7a

    :cond_6c
    if-eqz v9, :cond_87

    const/16 v21, 0x1c

    move/from16 v0, v21

    if-lt v13, v0, :cond_87

    const/16 v21, 0x1f

    move/from16 v0, v21

    if-gt v13, v0, :cond_87

    .line 248
    :cond_7a
    const/4 v7, 0x0

    .line 249
    new-instance v21, Lcom/nineoldandroids/animation/ArgbEvaluator;

    invoke-direct/range {v21 .. v21}, Lcom/nineoldandroids/animation/ArgbEvaluator;-><init>()V

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setEvaluator(Lcom/nineoldandroids/animation/TypeEvaluator;)V

    .line 252
    :cond_87
    if-eqz v7, :cond_193

    .line 255
    if-eqz v8, :cond_163

    .line 256
    const/16 v21, 0x5

    move/from16 v0, v21

    if-ne v6, v0, :cond_136

    .line 257
    const/16 v21, 0x0

    move/from16 v0, v17

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v16

    .line 261
    .local v16, "valueFrom":F
    :goto_9b
    if-eqz v9, :cond_14e

    .line 262
    const/16 v21, 0x5

    move/from16 v0, v21

    if-ne v13, v0, :cond_142

    .line 263
    const/16 v21, 0x0

    move/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v18

    .line 267
    .local v18, "valueTo":F
    :goto_ad
    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput v16, v21, v22

    const/16 v22, 0x1

    aput v18, v21, v22

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setFloatValues([F)V

    .line 319
    .end local v16    # "valueFrom":F
    .end local v18    # "valueTo":F
    :cond_c4
    :goto_c4
    move-object/from16 v0, p2

    invoke-virtual {v0, v4, v5}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 320
    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Lcom/nineoldandroids/animation/ValueAnimator;->setStartDelay(J)V

    .line 322
    const/16 v21, 0x3

    move/from16 v0, v21

    invoke-virtual {v3, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v21

    if-eqz v21, :cond_eb

    .line 323
    const/16 v21, 0x3

    const/16 v22, 0x0

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v21

    move-object/from16 v0, p2

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setRepeatCount(I)V

    .line 326
    :cond_eb
    const/16 v21, 0x4

    move/from16 v0, v21

    invoke-virtual {v3, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v21

    if-eqz v21, :cond_108

    .line 327
    const/16 v21, 0x4

    const/16 v22, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v21

    move-object/from16 v0, p2

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setRepeatMode(I)V

    .line 335
    :cond_108
    const/16 v21, 0x0

    const/16 v22, 0x0

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v10

    .line 337
    .local v10, "resID":I
    if-lez v10, :cond_123

    .line 338
    move-object/from16 v0, p0

    invoke-static {v0, v10}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v21

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 340
    :cond_123
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 342
    return-object p2

    .line 234
    .end local v6    # "fromType":I
    .end local v7    # "getFloats":Z
    .end local v8    # "hasFrom":Z
    .end local v9    # "hasTo":Z
    .end local v10    # "resID":I
    .end local v13    # "toType":I
    .end local v14    # "tvFrom":Landroid/util/TypedValue;
    .end local v15    # "tvTo":Landroid/util/TypedValue;
    :cond_127
    const/4 v7, 0x0

    goto/16 :goto_44

    .line 237
    .restart local v7    # "getFloats":Z
    .restart local v14    # "tvFrom":Landroid/util/TypedValue;
    :cond_12a
    const/4 v8, 0x0

    goto/16 :goto_4d

    .line 238
    .restart local v8    # "hasFrom":Z
    :cond_12d
    const/4 v6, 0x0

    goto/16 :goto_51

    .line 240
    .restart local v6    # "fromType":I
    .restart local v15    # "tvTo":Landroid/util/TypedValue;
    :cond_130
    const/4 v9, 0x0

    goto/16 :goto_5a

    .line 241
    .restart local v9    # "hasTo":Z
    :cond_133
    const/4 v13, 0x0

    goto/16 :goto_5e

    .line 259
    .restart local v13    # "toType":I
    :cond_136
    const/16 v21, 0x0

    move/from16 v0, v17

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v16

    .restart local v16    # "valueFrom":F
    goto/16 :goto_9b

    .line 265
    :cond_142
    const/16 v21, 0x0

    move/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v18

    .restart local v18    # "valueTo":F
    goto/16 :goto_ad

    .line 269
    .end local v18    # "valueTo":F
    :cond_14e
    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput v16, v21, v22

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setFloatValues([F)V

    goto/16 :goto_c4

    .line 272
    .end local v16    # "valueFrom":F
    :cond_163
    const/16 v21, 0x5

    move/from16 v0, v21

    if-ne v13, v0, :cond_188

    .line 273
    const/16 v21, 0x0

    move/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v18

    .line 277
    .restart local v18    # "valueTo":F
    :goto_173
    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput v18, v21, v22

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setFloatValues([F)V

    goto/16 :goto_c4

    .line 275
    .end local v18    # "valueTo":F
    :cond_188
    const/16 v21, 0x0

    move/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v18

    .restart local v18    # "valueTo":F
    goto :goto_173

    .line 282
    .end local v18    # "valueTo":F
    :cond_193
    if-eqz v8, :cond_233

    .line 283
    const/16 v21, 0x5

    move/from16 v0, v21

    if-ne v6, v0, :cond_1da

    .line 284
    const/16 v21, 0x0

    move/from16 v0, v17

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v21

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v16, v0

    .line 291
    .local v16, "valueFrom":I
    :goto_1aa
    if-eqz v9, :cond_21e

    .line 292
    const/16 v21, 0x5

    move/from16 v0, v21

    if-ne v13, v0, :cond_1fc

    .line 293
    const/16 v21, 0x0

    move/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v21

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v18, v0

    .line 300
    .local v18, "valueTo":I
    :goto_1c1
    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [I

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput v16, v21, v22

    const/16 v22, 0x1

    aput v18, v21, v22

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setIntValues([I)V

    goto/16 :goto_c4

    .line 285
    .end local v16    # "valueFrom":I
    .end local v18    # "valueTo":I
    :cond_1da
    const/16 v21, 0x1c

    move/from16 v0, v21

    if-lt v6, v0, :cond_1f1

    const/16 v21, 0x1f

    move/from16 v0, v21

    if-gt v6, v0, :cond_1f1

    .line 287
    const/16 v21, 0x0

    move/from16 v0, v17

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v16

    .restart local v16    # "valueFrom":I
    goto :goto_1aa

    .line 289
    .end local v16    # "valueFrom":I
    :cond_1f1
    const/16 v21, 0x0

    move/from16 v0, v17

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v16

    .restart local v16    # "valueFrom":I
    goto :goto_1aa

    .line 294
    :cond_1fc
    const/16 v21, 0x1c

    move/from16 v0, v21

    if-lt v13, v0, :cond_213

    const/16 v21, 0x1f

    move/from16 v0, v21

    if-gt v13, v0, :cond_213

    .line 296
    const/16 v21, 0x0

    move/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v18

    .restart local v18    # "valueTo":I
    goto :goto_1c1

    .line 298
    .end local v18    # "valueTo":I
    :cond_213
    const/16 v21, 0x0

    move/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v18

    .restart local v18    # "valueTo":I
    goto :goto_1c1

    .line 302
    .end local v18    # "valueTo":I
    :cond_21e
    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [I

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput v16, v21, v22

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setIntValues([I)V

    goto/16 :goto_c4

    .line 305
    .end local v16    # "valueFrom":I
    :cond_233
    if-eqz v9, :cond_c4

    .line 306
    const/16 v21, 0x5

    move/from16 v0, v21

    if-ne v13, v0, :cond_25f

    .line 307
    const/16 v21, 0x0

    move/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v21

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v18, v0

    .line 314
    .restart local v18    # "valueTo":I
    :goto_24a
    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [I

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput v18, v21, v22

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setIntValues([I)V

    goto/16 :goto_c4

    .line 308
    .end local v18    # "valueTo":I
    :cond_25f
    const/16 v21, 0x1c

    move/from16 v0, v21

    if-lt v13, v0, :cond_276

    const/16 v21, 0x1f

    move/from16 v0, v21

    if-gt v13, v0, :cond_276

    .line 310
    const/16 v21, 0x0

    move/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v18

    .restart local v18    # "valueTo":I
    goto :goto_24a

    .line 312
    .end local v18    # "valueTo":I
    :cond_276
    const/16 v21, 0x0

    move/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v18

    .restart local v18    # "valueTo":I
    goto :goto_24a
.end method

.method private static loadObjectAnimator(Landroid/content/Context;Landroid/util/AttributeSet;)Lcom/nineoldandroids/animation/ObjectAnimator;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 190
    new-instance v1, Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-direct {v1}, Lcom/nineoldandroids/animation/ObjectAnimator;-><init>()V

    .line 192
    .local v1, "anim":Lcom/nineoldandroids/animation/ObjectAnimator;
    invoke-static {p0, p1, v1}, Lcom/nineoldandroids/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/nineoldandroids/animation/ValueAnimator;)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 194
    sget-object v3, Lcom/nineoldandroids/animation/AnimatorInflater;->PropertyAnimator:[I

    invoke-virtual {p0, p1, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 197
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 199
    .local v2, "propertyName":Ljava/lang/String;
    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setPropertyName(Ljava/lang/String;)V

    .line 201
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 203
    return-object v1
.end method
