.class Landroid/support/v7/preference/PreferenceInflater;
.super Ljava/lang/Object;
.source "PreferenceInflater.java"


# static fields
.field private static final CONSTRUCTOR_MAP:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Constructor;",
            ">;"
        }
    .end annotation
.end field

.field private static final CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static final EXTRA_TAG_NAME:Ljava/lang/String; = "extra"

.field private static final INTENT_TAG_NAME:Ljava/lang/String; = "intent"

.field private static final TAG:Ljava/lang/String; = "PreferenceInflater"


# instance fields
.field private final mConstructorArgs:[Ljava/lang/Object;

.field private final mContext:Landroid/content/Context;

.field private mDefaultPackages:[Ljava/lang/String;

.field private mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 43
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Landroid/content/Context;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Landroid/util/AttributeSet;

    aput-object v2, v0, v1

    sput-object v0, Landroid/support/v7/preference/PreferenceInflater;->CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/support/v7/preference/PreferenceInflater;->CONSTRUCTOR_MAP:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/support/v7/preference/PreferenceManager;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "preferenceManager"    # Landroid/support/v7/preference/PreferenceManager;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v7/preference/PreferenceInflater;->mConstructorArgs:[Ljava/lang/Object;

    .line 60
    iput-object p1, p0, Landroid/support/v7/preference/PreferenceInflater;->mContext:Landroid/content/Context;

    .line 61
    invoke-direct {p0, p2}, Landroid/support/v7/preference/PreferenceInflater;->init(Landroid/support/v7/preference/PreferenceManager;)V

    .line 62
    return-void
.end method

.method private createItem(Ljava/lang/String;[Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/support/v7/preference/Preference;
    .registers 19
    .param p1, "name"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "prefixes"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Landroid/view/InflateException;
        }
    .end annotation

    .prologue
    .line 219
    sget-object v12, Landroid/support/v7/preference/PreferenceInflater;->CONSTRUCTOR_MAP:Ljava/util/HashMap;

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/reflect/Constructor;

    .line 222
    .local v5, "constructor":Ljava/lang/reflect/Constructor;
    if-nez v5, :cond_31

    .line 225
    :try_start_c
    iget-object v12, p0, Landroid/support/v7/preference/PreferenceInflater;->mContext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    .line 226
    .local v3, "classLoader":Ljava/lang/ClassLoader;
    const/4 v4, 0x0

    .line 227
    .local v4, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p2, :cond_1a

    move-object/from16 v0, p2

    array-length v12, v0

    if-nez v12, :cond_3d

    .line 228
    :cond_1a
    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 249
    :cond_20
    sget-object v12, Landroid/support/v7/preference/PreferenceInflater;->CONSTRUCTOR_SIGNATURE:[Ljava/lang/Class;

    invoke-virtual {v4, v12}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    .line 250
    const/4 v12, 0x1

    invoke-virtual {v5, v12}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 251
    sget-object v12, Landroid/support/v7/preference/PreferenceInflater;->CONSTRUCTOR_MAP:Ljava/util/HashMap;

    move-object/from16 v0, p1

    invoke-virtual {v12, v0, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    .end local v3    # "classLoader":Ljava/lang/ClassLoader;
    .end local v4    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_31
    iget-object v1, p0, Landroid/support/v7/preference/PreferenceInflater;->mConstructorArgs:[Ljava/lang/Object;

    .line 255
    .local v1, "args":[Ljava/lang/Object;
    const/4 v12, 0x1

    aput-object p3, v1, v12

    .line 256
    invoke-virtual {v5, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/support/v7/preference/Preference;

    return-object v12

    .line 230
    .end local v1    # "args":[Ljava/lang/Object;
    .restart local v3    # "classLoader":Ljava/lang/ClassLoader;
    .restart local v4    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3d
    const/4 v10, 0x0

    .line 231
    .local v10, "notFoundException":Ljava/lang/ClassNotFoundException;
    move-object/from16 v2, p2

    .local v2, "arr$":[Ljava/lang/String;
    array-length v9, v2

    .local v9, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_42
    if-ge v7, v9, :cond_5d

    aget-object v11, v2, v7
    :try_end_46
    .catch Ljava/lang/ClassNotFoundException; {:try_start_c .. :try_end_46} :catch_84
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_46} :catch_8c

    .line 233
    .local v11, "prefix":Ljava/lang/String;
    :try_start_46
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3, v12}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_5c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_46 .. :try_end_5c} :catch_86
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_5c} :catch_8c

    move-result-object v4

    .line 239
    .end local v11    # "prefix":Ljava/lang/String;
    :cond_5d
    if-nez v4, :cond_20

    .line 240
    if-nez v10, :cond_8b

    .line 241
    :try_start_61
    new-instance v12, Landroid/view/InflateException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface/range {p3 .. p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ": Error inflating class "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_84
    .catch Ljava/lang/ClassNotFoundException; {:try_start_61 .. :try_end_84} :catch_84
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_84} :catch_8c

    .line 258
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v3    # "classLoader":Ljava/lang/ClassLoader;
    .end local v4    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "i$":I
    .end local v9    # "len$":I
    .end local v10    # "notFoundException":Ljava/lang/ClassNotFoundException;
    :catch_84
    move-exception v6

    .line 260
    .local v6, "e":Ljava/lang/ClassNotFoundException;
    throw v6

    .line 235
    .end local v6    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v2    # "arr$":[Ljava/lang/String;
    .restart local v3    # "classLoader":Ljava/lang/ClassLoader;
    .restart local v4    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v7    # "i$":I
    .restart local v9    # "len$":I
    .restart local v10    # "notFoundException":Ljava/lang/ClassNotFoundException;
    .restart local v11    # "prefix":Ljava/lang/String;
    :catch_86
    move-exception v6

    .line 236
    .restart local v6    # "e":Ljava/lang/ClassNotFoundException;
    move-object v10, v6

    .line 231
    add-int/lit8 v7, v7, 0x1

    goto :goto_42

    .line 245
    .end local v6    # "e":Ljava/lang/ClassNotFoundException;
    .end local v11    # "prefix":Ljava/lang/String;
    :cond_8b
    :try_start_8b
    throw v10
    :try_end_8c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_8b .. :try_end_8c} :catch_84
    .catch Ljava/lang/Exception; {:try_start_8b .. :try_end_8c} :catch_8c

    .line 261
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v3    # "classLoader":Ljava/lang/ClassLoader;
    .end local v4    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "i$":I
    .end local v9    # "len$":I
    .end local v10    # "notFoundException":Ljava/lang/ClassNotFoundException;
    :catch_8c
    move-exception v6

    .line 262
    .local v6, "e":Ljava/lang/Exception;
    new-instance v8, Landroid/view/InflateException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface/range {p3 .. p3}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ": Error inflating class "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v8, v12}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    .line 264
    .local v8, "ie":Landroid/view/InflateException;
    invoke-virtual {v8, v6}, Landroid/view/InflateException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 265
    throw v8
.end method

.method private createItemFromTag(Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/support/v7/preference/Preference;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 289
    const/4 v3, -0x1

    const/16 v4, 0x2e

    :try_start_3
    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-ne v3, v4, :cond_e

    .line 290
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/preference/PreferenceInflater;->onCreateItem(Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 295
    .local v2, "item":Landroid/support/v7/preference/Preference;
    :goto_d
    return-object v2

    .line 292
    .end local v2    # "item":Landroid/support/v7/preference/Preference;
    :cond_e
    const/4 v3, 0x0

    invoke-direct {p0, p1, v3, p2}, Landroid/support/v7/preference/PreferenceInflater;->createItem(Ljava/lang/String;[Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/support/v7/preference/Preference;
    :try_end_12
    .catch Landroid/view/InflateException; {:try_start_3 .. :try_end_12} :catch_14
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_12} :catch_16
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_12} :catch_3b

    move-result-object v2

    .restart local v2    # "item":Landroid/support/v7/preference/Preference;
    goto :goto_d

    .line 297
    .end local v2    # "item":Landroid/support/v7/preference/Preference;
    :catch_14
    move-exception v0

    .line 298
    .local v0, "e":Landroid/view/InflateException;
    throw v0

    .line 300
    .end local v0    # "e":Landroid/view/InflateException;
    :catch_16
    move-exception v0

    .line 301
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Landroid/view/InflateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p2}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": Error inflating class (not found)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    .line 304
    .local v1, "ie":Landroid/view/InflateException;
    invoke-virtual {v1, v0}, Landroid/view/InflateException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 305
    throw v1

    .line 307
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    .end local v1    # "ie":Landroid/view/InflateException;
    :catch_3b
    move-exception v0

    .line 308
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Landroid/view/InflateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p2}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": Error inflating class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    .line 311
    .restart local v1    # "ie":Landroid/view/InflateException;
    invoke-virtual {v1, v0}, Landroid/view/InflateException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 312
    throw v1
.end method

.method private init(Landroid/support/v7/preference/PreferenceManager;)V
    .registers 6
    .param p1, "preferenceManager"    # Landroid/support/v7/preference/PreferenceManager;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 65
    iput-object p1, p0, Landroid/support/v7/preference/PreferenceInflater;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    .line 66
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_19

    .line 67
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "android.support.v14.preference."

    aput-object v1, v0, v2

    const-string v1, "android.support.v7.preference."

    aput-object v1, v0, v3

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/PreferenceInflater;->setDefaultPackages([Ljava/lang/String;)V

    .line 72
    :goto_18
    return-void

    .line 70
    :cond_19
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "android.support.v7.preference."

    aput-object v1, v0, v2

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/PreferenceInflater;->setDefaultPackages([Ljava/lang/String;)V

    goto :goto_18
.end method

.method private onMergeRoots(Landroid/support/v7/preference/PreferenceGroup;Landroid/support/v7/preference/PreferenceGroup;)Landroid/support/v7/preference/PreferenceGroup;
    .registers 4
    .param p1, "givenRoot"    # Landroid/support/v7/preference/PreferenceGroup;
    .param p2, "xmlRoot"    # Landroid/support/v7/preference/PreferenceGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 191
    if-nez p1, :cond_8

    .line 192
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceInflater;->mPreferenceManager:Landroid/support/v7/preference/PreferenceManager;

    invoke-virtual {p2, v0}, Landroid/support/v7/preference/PreferenceGroup;->onAttachedToHierarchy(Landroid/support/v7/preference/PreferenceManager;)V

    .line 195
    .end local p2    # "xmlRoot":Landroid/support/v7/preference/PreferenceGroup;
    :goto_7
    return-object p2

    .restart local p2    # "xmlRoot":Landroid/support/v7/preference/PreferenceGroup;
    :cond_8
    move-object p2, p1

    goto :goto_7
.end method

.method private rInflate(Lorg/xmlpull/v1/XmlPullParser;Landroid/support/v7/preference/Preference;Landroid/util/AttributeSet;)V
    .registers 14
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "parent"    # Landroid/support/v7/preference/Preference;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 322
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v0

    .line 326
    .local v0, "depth":I
    :cond_4
    :goto_4
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    .local v6, "type":I
    const/4 v7, 0x3

    if-ne v6, v7, :cond_11

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v7

    if-le v7, v0, :cond_76

    :cond_11
    const/4 v7, 0x1

    if-eq v6, v7, :cond_76

    .line 328
    const/4 v7, 0x2

    if-ne v6, v7, :cond_4

    .line 332
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 334
    .local v5, "name":Ljava/lang/String;
    const-string v7, "intent"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3f

    .line 338
    :try_start_23
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceInflater;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-static {v7, p1, p3}, Landroid/content/Intent;->parseIntent(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)Landroid/content/Intent;
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_2e} :catch_33

    move-result-object v3

    .line 346
    .local v3, "intent":Landroid/content/Intent;
    invoke-virtual {p2, v3}, Landroid/support/v7/preference/Preference;->setIntent(Landroid/content/Intent;)V

    goto :goto_4

    .line 339
    .end local v3    # "intent":Landroid/content/Intent;
    :catch_33
    move-exception v1

    .line 340
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v7, "Error parsing preference"

    invoke-direct {v2, v7}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 342
    .local v2, "ex":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v2, v1}, Lorg/xmlpull/v1/XmlPullParserException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 343
    throw v2

    .line 347
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "ex":Lorg/xmlpull/v1/XmlPullParserException;
    :cond_3f
    const-string v7, "extra"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_68

    .line 348
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceInflater;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const-string v8, "extra"

    invoke-virtual {p2}, Landroid/support/v7/preference/Preference;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    invoke-virtual {v7, v8, p3, v9}, Landroid/content/res/Resources;->parseBundleExtra(Ljava/lang/String;Landroid/util/AttributeSet;Landroid/os/Bundle;)V

    .line 351
    :try_start_58
    invoke-static {p1}, Landroid/support/v7/preference/PreferenceInflater;->skipCurrentTag(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_5b
    .catch Ljava/io/IOException; {:try_start_58 .. :try_end_5b} :catch_5c

    goto :goto_4

    .line 352
    :catch_5c
    move-exception v1

    .line 353
    .restart local v1    # "e":Ljava/io/IOException;
    new-instance v2, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v7, "Error parsing preference"

    invoke-direct {v2, v7}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 355
    .restart local v2    # "ex":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v2, v1}, Lorg/xmlpull/v1/XmlPullParserException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 356
    throw v2

    .line 359
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "ex":Lorg/xmlpull/v1/XmlPullParserException;
    :cond_68
    invoke-direct {p0, v5, p3}, Landroid/support/v7/preference/PreferenceInflater;->createItemFromTag(Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/support/v7/preference/Preference;

    move-result-object v4

    .local v4, "item":Landroid/support/v7/preference/Preference;
    move-object v7, p2

    .line 360
    check-cast v7, Landroid/support/v7/preference/PreferenceGroup;

    invoke-virtual {v7, v4}, Landroid/support/v7/preference/PreferenceGroup;->addItemFromInflater(Landroid/support/v7/preference/Preference;)V

    .line 361
    invoke-direct {p0, p1, v4, p3}, Landroid/support/v7/preference/PreferenceInflater;->rInflate(Lorg/xmlpull/v1/XmlPullParser;Landroid/support/v7/preference/Preference;Landroid/util/AttributeSet;)V

    goto :goto_4

    .line 365
    .end local v4    # "item":Landroid/support/v7/preference/Preference;
    .end local v5    # "name":Ljava/lang/String;
    :cond_76
    return-void
.end method

.method private static skipCurrentTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 4
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 369
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v0

    .line 372
    .local v0, "outerDepth":I
    :cond_4
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 374
    .local v1, "type":I
    const/4 v2, 0x1

    if-eq v1, v2, :cond_14

    const/4 v2, 0x3

    if-ne v1, v2, :cond_4

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v2

    if-gt v2, v0, :cond_4

    .line 375
    :cond_14
    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceInflater;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getDefaultPackages()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceInflater;->mDefaultPackages:[Ljava/lang/String;

    return-object v0
.end method

.method public inflate(ILandroid/support/v7/preference/PreferenceGroup;)Landroid/support/v7/preference/Preference;
    .registers 5
    .param p1, "resource"    # I
    .param p2, "root"    # Landroid/support/v7/preference/PreferenceGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 115
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceInflater;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v0

    .line 117
    .local v0, "parser":Landroid/content/res/XmlResourceParser;
    :try_start_c
    invoke-virtual {p0, v0, p2}, Landroid/support/v7/preference/PreferenceInflater;->inflate(Lorg/xmlpull/v1/XmlPullParser;Landroid/support/v7/preference/PreferenceGroup;)Landroid/support/v7/preference/Preference;
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_14

    move-result-object v1

    .line 119
    invoke-interface {v0}, Landroid/content/res/XmlResourceParser;->close()V

    return-object v1

    :catchall_14
    move-exception v1

    invoke-interface {v0}, Landroid/content/res/XmlResourceParser;->close()V

    throw v1
.end method

.method public inflate(Lorg/xmlpull/v1/XmlPullParser;Landroid/support/v7/preference/PreferenceGroup;)Landroid/support/v7/preference/Preference;
    .registers 14
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "root"    # Landroid/support/v7/preference/PreferenceGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v10, 0x2

    .line 143
    iget-object v7, p0, Landroid/support/v7/preference/PreferenceInflater;->mConstructorArgs:[Ljava/lang/Object;

    monitor-enter v7

    .line 144
    :try_start_4
    invoke-static {p1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v0

    .line 145
    .local v0, "attrs":Landroid/util/AttributeSet;
    iget-object v6, p0, Landroid/support/v7/preference/PreferenceInflater;->mConstructorArgs:[Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Landroid/support/v7/preference/PreferenceInflater;->mContext:Landroid/content/Context;

    aput-object v9, v6, v8
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_39

    .line 152
    :cond_f
    :try_start_f
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    .line 153
    .local v4, "type":I
    if-eq v4, v10, :cond_18

    const/4 v6, 0x1

    if-ne v4, v6, :cond_f

    .line 155
    :cond_18
    if-eq v4, v10, :cond_3c

    .line 156
    new-instance v6, Landroid/view/InflateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": No start tag found!"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_37
    .catch Landroid/view/InflateException; {:try_start_f .. :try_end_37} :catch_37
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_f .. :try_end_37} :catch_4f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_37} :catch_5d
    .catchall {:try_start_f .. :try_end_37} :catchall_39

    .line 169
    .end local v4    # "type":I
    :catch_37
    move-exception v1

    .line 170
    .local v1, "e":Landroid/view/InflateException;
    :try_start_38
    throw v1

    .line 184
    .end local v0    # "attrs":Landroid/util/AttributeSet;
    .end local v1    # "e":Landroid/view/InflateException;
    :catchall_39
    move-exception v6

    monitor-exit v7
    :try_end_3b
    .catchall {:try_start_38 .. :try_end_3b} :catchall_39

    throw v6

    .line 161
    .restart local v0    # "attrs":Landroid/util/AttributeSet;
    .restart local v4    # "type":I
    :cond_3c
    :try_start_3c
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6, v0}, Landroid/support/v7/preference/PreferenceInflater;->createItemFromTag(Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/support/v7/preference/Preference;

    move-result-object v5

    .line 164
    .local v5, "xmlRoot":Landroid/support/v7/preference/Preference;
    check-cast v5, Landroid/support/v7/preference/PreferenceGroup;

    .end local v5    # "xmlRoot":Landroid/support/v7/preference/Preference;
    invoke-direct {p0, p2, v5}, Landroid/support/v7/preference/PreferenceInflater;->onMergeRoots(Landroid/support/v7/preference/PreferenceGroup;Landroid/support/v7/preference/PreferenceGroup;)Landroid/support/v7/preference/PreferenceGroup;

    move-result-object v3

    .line 167
    .local v3, "result":Landroid/support/v7/preference/Preference;
    invoke-direct {p0, p1, v3, v0}, Landroid/support/v7/preference/PreferenceInflater;->rInflate(Lorg/xmlpull/v1/XmlPullParser;Landroid/support/v7/preference/Preference;Landroid/util/AttributeSet;)V
    :try_end_4d
    .catch Landroid/view/InflateException; {:try_start_3c .. :try_end_4d} :catch_37
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3c .. :try_end_4d} :catch_4f
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_4d} :catch_5d
    .catchall {:try_start_3c .. :try_end_4d} :catchall_39

    .line 183
    :try_start_4d
    monitor-exit v7

    return-object v3

    .line 171
    .end local v3    # "result":Landroid/support/v7/preference/Preference;
    .end local v4    # "type":I
    :catch_4f
    move-exception v1

    .line 172
    .local v1, "e":Lorg/xmlpull/v1/XmlPullParserException;
    new-instance v2, Landroid/view/InflateException;

    invoke-virtual {v1}, Lorg/xmlpull/v1/XmlPullParserException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    .line 173
    .local v2, "ex":Landroid/view/InflateException;
    invoke-virtual {v2, v1}, Landroid/view/InflateException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 174
    throw v2

    .line 175
    .end local v1    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .end local v2    # "ex":Landroid/view/InflateException;
    :catch_5d
    move-exception v1

    .line 176
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Landroid/view/InflateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ": "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    .line 179
    .restart local v2    # "ex":Landroid/view/InflateException;
    invoke-virtual {v2, v1}, Landroid/view/InflateException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 180
    throw v2
    :try_end_86
    .catchall {:try_start_4d .. :try_end_86} :catchall_39
.end method

.method protected onCreateItem(Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/support/v7/preference/Preference;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 281
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceInflater;->mDefaultPackages:[Ljava/lang/String;

    invoke-direct {p0, p1, v0, p2}, Landroid/support/v7/preference/PreferenceInflater;->createItem(Ljava/lang/String;[Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/support/v7/preference/Preference;

    move-result-object v0

    return-object v0
.end method

.method public setDefaultPackages([Ljava/lang/String;)V
    .registers 2
    .param p1, "defaultPackage"    # [Ljava/lang/String;

    .prologue
    .line 82
    iput-object p1, p0, Landroid/support/v7/preference/PreferenceInflater;->mDefaultPackages:[Ljava/lang/String;

    .line 83
    return-void
.end method
