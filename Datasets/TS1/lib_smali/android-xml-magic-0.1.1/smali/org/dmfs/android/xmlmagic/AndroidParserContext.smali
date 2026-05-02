.class public Lorg/dmfs/android/xmlmagic/AndroidParserContext;
.super Lorg/dmfs/xmlobjects/pull/ParserContext;


# instance fields
.field private final mAppContext:Landroid/content/Context;

.field private final mResolver:Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

.field private final mResources:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)V
    .registers 4

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/pull/ParserContext;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->mAppContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->mResources:Landroid/content/res/Resources;

    iput-object p2, p0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->mResolver:Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

    return-void
.end method


# virtual methods
.method public getAppContext()Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->mAppContext:Landroid/content/Context;

    return-object v0
.end method

.method public getResolver()Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->mResolver:Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->mResources:Landroid/content/res/Resources;

    return-object v0
.end method
