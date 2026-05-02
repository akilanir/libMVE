.class Lcom/google/tts/ITtsBeta$Stub$Proxy;
.super Ljava/lang/Object;
.source "ITtsBeta.java"

# interfaces
.implements Lcom/google/tts/ITtsBeta;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/tts/ITtsBeta$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Proxy"
.end annotation


# instance fields
.field private mRemote:Landroid/os/IBinder;


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .registers 2
    .param p1, "remote"    # Landroid/os/IBinder;

    .prologue
    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 289
    iput-object p1, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    .line 290
    return-void
.end method


# virtual methods
.method public addEarcon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 10
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "earcon"    # Ljava/lang/String;
    .param p3, "packageName"    # Ljava/lang/String;
    .param p4, "resId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 530
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 531
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 533
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 534
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 535
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 536
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 537
    invoke-virtual {v0, p4}, Landroid/os/Parcel;->writeInt(I)V

    .line 538
    iget-object v2, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0xd

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 539
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_24
    .catchall {:try_start_8 .. :try_end_24} :catchall_2b

    .line 542
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 543
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 545
    return-void

    .line 541
    :catchall_2b
    move-exception v2

    .line 542
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 543
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 544
    throw v2
.end method

.method public addEarconFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "earcon"    # Ljava/lang/String;
    .param p3, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 548
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 549
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 551
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 552
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 553
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 554
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 555
    iget-object v2, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v3, 0xe

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 556
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_21
    .catchall {:try_start_8 .. :try_end_21} :catchall_28

    .line 559
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 560
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 562
    return-void

    .line 558
    :catchall_28
    move-exception v2

    .line 559
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 560
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 561
    throw v2
.end method

.method public addSpeech(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 10
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "packageName"    # Ljava/lang/String;
    .param p4, "resId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 395
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 396
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 398
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 399
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 400
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 401
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 402
    invoke-virtual {v0, p4}, Landroid/os/Parcel;->writeInt(I)V

    .line 403
    iget-object v2, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v3, 0x6

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 404
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_23
    .catchall {:try_start_8 .. :try_end_23} :catchall_2a

    .line 407
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 408
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 410
    return-void

    .line 406
    :catchall_2a
    move-exception v2

    .line 407
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 408
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 409
    throw v2
.end method

.method public addSpeechFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 413
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 414
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 416
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v2, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 417
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 418
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 419
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 420
    iget-object v2, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v3, 0x7

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 421
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V
    :try_end_20
    .catchall {:try_start_8 .. :try_end_20} :catchall_27

    .line 424
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 425
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 427
    return-void

    .line 423
    :catchall_27
    move-exception v2

    .line 424
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 425
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 426
    throw v2
.end method

.method public asBinder()Landroid/os/IBinder;
    .registers 2

    .prologue
    .line 293
    iget-object v0, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-object v0
.end method

.method public getInterfaceDescriptor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 297
    const-string v0, "com.google.tts.ITtsBeta"

    return-object v0
.end method

.method public getLanguage()[Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 430
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 431
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 434
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 435
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0x8

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 436
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 437
    invoke-virtual {v1}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;
    :try_end_1b
    .catchall {:try_start_8 .. :try_end_1b} :catchall_23

    move-result-object v2

    .line 440
    .local v2, "_result":[Ljava/lang/String;
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 441
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 443
    return-object v2

    .line 439
    .end local v2    # "_result":[Ljava/lang/String;
    :catchall_23
    move-exception v3

    .line 440
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 441
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 442
    throw v3
.end method

.method public isLanguageAvailable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .registers 10
    .param p1, "language"    # Ljava/lang/String;
    .param p2, "country"    # Ljava/lang/String;
    .param p3, "variant"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 447
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 448
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 451
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 452
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 453
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 454
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 455
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0x9

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 456
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 457
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_24
    .catchall {:try_start_8 .. :try_end_24} :catchall_2c

    move-result v2

    .line 460
    .local v2, "_result":I
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 461
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 463
    return v2

    .line 459
    .end local v2    # "_result":I
    :catchall_2c
    move-exception v3

    .line 460
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 461
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 462
    throw v3
.end method

.method public isSpeaking()Z
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 360
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 361
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 364
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_9
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 365
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v4, 0x4

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 366
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 367
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_1b
    .catchall {:try_start_9 .. :try_end_1b} :catchall_26

    move-result v3

    if-eqz v3, :cond_1f

    const/4 v2, 0x1

    .line 370
    .local v2, "_result":Z
    :cond_1f
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 371
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 373
    return v2

    .line 369
    .end local v2    # "_result":Z
    :catchall_26
    move-exception v3

    .line 370
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 371
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 372
    throw v3
.end method

.method public playEarcon(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)I
    .registers 11
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "earcon"    # Ljava/lang/String;
    .param p3, "queueMode"    # I
    .param p4, "params"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 509
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 510
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 513
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 514
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 515
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 516
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 517
    invoke-virtual {v0, p4}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 518
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0xc

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 519
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 520
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_27
    .catchall {:try_start_8 .. :try_end_27} :catchall_2f

    move-result v2

    .line 523
    .local v2, "_result":I
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 524
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 526
    return v2

    .line 522
    .end local v2    # "_result":I
    :catchall_2f
    move-exception v3

    .line 523
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 524
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 525
    throw v3
.end method

.method public playSilence(Ljava/lang/String;JI[Ljava/lang/String;)I
    .registers 12
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "duration"    # J
    .param p4, "queueMode"    # I
    .param p5, "params"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 603
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 604
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 607
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 608
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 609
    invoke-virtual {v0, p2, p3}, Landroid/os/Parcel;->writeLong(J)V

    .line 610
    invoke-virtual {v0, p4}, Landroid/os/Parcel;->writeInt(I)V

    .line 611
    invoke-virtual {v0, p5}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 612
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0x11

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 613
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 614
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_27
    .catchall {:try_start_8 .. :try_end_27} :catchall_2f

    move-result v2

    .line 617
    .local v2, "_result":I
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 618
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 620
    return v2

    .line 616
    .end local v2    # "_result":I
    :catchall_2f
    move-exception v3

    .line 617
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 618
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 619
    throw v3
.end method

.method public registerCallback(Ljava/lang/String;Lcom/google/tts/ITtsCallbackBeta;)I
    .registers 9
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "cb"    # Lcom/google/tts/ITtsCallbackBeta;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 565
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 566
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 569
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 570
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 571
    if-eqz p2, :cond_2f

    invoke-interface {p2}, Lcom/google/tts/ITtsCallbackBeta;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    :goto_16
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 572
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0xf

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 573
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 574
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_27
    .catchall {:try_start_8 .. :try_end_27} :catchall_31

    move-result v2

    .line 577
    .local v2, "_result":I
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 578
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 580
    return v2

    .line 571
    .end local v2    # "_result":I
    :cond_2f
    const/4 v3, 0x0

    goto :goto_16

    .line 576
    :catchall_31
    move-exception v3

    .line 577
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 578
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 579
    throw v3
.end method

.method public setLanguage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .registers 11
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "language"    # Ljava/lang/String;
    .param p3, "country"    # Ljava/lang/String;
    .param p4, "variant"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 467
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 468
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 471
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 472
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 473
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 474
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 475
    invoke-virtual {v0, p4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 476
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0xa

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 477
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 478
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_27
    .catchall {:try_start_8 .. :try_end_27} :catchall_2f

    move-result v2

    .line 481
    .local v2, "_result":I
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 482
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 484
    return v2

    .line 480
    .end local v2    # "_result":I
    :catchall_2f
    move-exception v3

    .line 481
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 482
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 483
    throw v3
.end method

.method public setPitch(Ljava/lang/String;I)I
    .registers 9
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "pitch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 320
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 321
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 324
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 325
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 326
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 327
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 328
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 329
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_20
    .catchall {:try_start_8 .. :try_end_20} :catchall_28

    move-result v2

    .line 332
    .local v2, "_result":I
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 333
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 335
    return v2

    .line 331
    .end local v2    # "_result":I
    :catchall_28
    move-exception v3

    .line 332
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 333
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 334
    throw v3
.end method

.method public setSpeechRate(Ljava/lang/String;I)I
    .registers 9
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "speechRate"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 301
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 302
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 305
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 306
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 307
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 308
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 309
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 310
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_20
    .catchall {:try_start_8 .. :try_end_20} :catchall_28

    move-result v2

    .line 313
    .local v2, "_result":I
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 314
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 316
    return v2

    .line 312
    .end local v2    # "_result":I
    :catchall_28
    move-exception v3

    .line 313
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 314
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 315
    throw v3
.end method

.method public speak(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)I
    .registers 11
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "queueMode"    # I
    .param p4, "params"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 339
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 340
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 343
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 344
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 345
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 346
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 347
    invoke-virtual {v0, p4}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 348
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v4, 0x3

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 349
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 350
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_26
    .catchall {:try_start_8 .. :try_end_26} :catchall_2e

    move-result v2

    .line 353
    .local v2, "_result":I
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 354
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 356
    return v2

    .line 352
    .end local v2    # "_result":I
    :catchall_2e
    move-exception v3

    .line 353
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 354
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 355
    throw v3
.end method

.method public stop(Ljava/lang/String;)I
    .registers 8
    .param p1, "callingApp"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 377
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 378
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 381
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 382
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 383
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v4, 0x5

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 384
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 385
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_1d
    .catchall {:try_start_8 .. :try_end_1d} :catchall_25

    move-result v2

    .line 388
    .local v2, "_result":I
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 389
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 391
    return v2

    .line 387
    .end local v2    # "_result":I
    :catchall_25
    move-exception v3

    .line 388
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 389
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 390
    throw v3
.end method

.method public synthesizeToFile(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z
    .registers 11
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "params"    # [Ljava/lang/String;
    .param p4, "outputDirectory"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 488
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 489
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 492
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_9
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 493
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 494
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 495
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 496
    invoke-virtual {v0, p4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 497
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0xb

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 498
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 499
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_28
    .catchall {:try_start_9 .. :try_end_28} :catchall_33

    move-result v3

    if-eqz v3, :cond_2c

    const/4 v2, 0x1

    .line 502
    .local v2, "_result":Z
    :cond_2c
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 503
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 505
    return v2

    .line 501
    .end local v2    # "_result":Z
    :catchall_33
    move-exception v3

    .line 502
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 503
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 504
    throw v3
.end method

.method public unregisterCallback(Ljava/lang/String;Lcom/google/tts/ITtsCallbackBeta;)I
    .registers 9
    .param p1, "callingApp"    # Ljava/lang/String;
    .param p2, "cb"    # Lcom/google/tts/ITtsCallbackBeta;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 584
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 585
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 588
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "com.google.tts.ITtsBeta"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 589
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 590
    if-eqz p2, :cond_2f

    invoke-interface {p2}, Lcom/google/tts/ITtsCallbackBeta;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    :goto_16
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 591
    iget-object v3, p0, Lcom/google/tts/ITtsBeta$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 v4, 0x10

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 592
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 593
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I
    :try_end_27
    .catchall {:try_start_8 .. :try_end_27} :catchall_31

    move-result v2

    .line 596
    .local v2, "_result":I
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 597
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 599
    return v2

    .line 590
    .end local v2    # "_result":I
    :cond_2f
    const/4 v3, 0x0

    goto :goto_16

    .line 595
    :catchall_31
    move-exception v3

    .line 596
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 597
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 598
    throw v3
.end method
