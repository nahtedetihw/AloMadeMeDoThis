@interface MRUNowPlayingVolumeSlider : UIView
@property (nonatomic, retain) UIView *growingThumbView;
@end

@interface MRUNowPlayingTimeControlsView : UIView
@property (nonatomic, retain) UIView *knobView;
@end

%hook MRUNowPlayingVolumeSlider
- (id)initWithFrame:(CGRect)frame {
    id o = %orig;
    if (self.growingThumbView) {
    self.growingThumbView.backgroundColor = [UIColor clearColor];
    self.growingThumbView.layer.shadowColor = [UIColor clearColor].CGColor;
    self.growingThumbView.layer.shadowOpacity = 0;

    UIImageView *newVolumeThumbView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,24,24)];
    newVolumeThumbView.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/AloMadeMeDoThis/newVolumeThumbImage.png"];
    [self.growingThumbView addSubview:newVolumeThumbView];
        
    newVolumeThumbView.translatesAutoresizingMaskIntoConstraints = false;
    [newVolumeThumbView.bottomAnchor constraintEqualToAnchor:self.growingThumbView.bottomAnchor constant:0].active = YES;
    [newVolumeThumbView.leftAnchor constraintEqualToAnchor:self.growingThumbView.leftAnchor constant:0].active = YES;
    [newVolumeThumbView.rightAnchor constraintEqualToAnchor:self.growingThumbView.rightAnchor constant:0].active = YES;
    [newVolumeThumbView.topAnchor constraintEqualToAnchor:self.growingThumbView.topAnchor constant:0].active = YES;
    }
    return o;
}
%end

%hook MRUNowPlayingTimeControlsView
- (id)initWithFrame:(CGRect)frame {
    id o = %orig;
    if (self.knobView) {
    self.knobView.backgroundColor = [UIColor clearColor];
    self.knobView.layer.shadowColor = [UIColor clearColor].CGColor;
    self.knobView.layer.shadowOpacity = 0;

    UIImageView *newTrackThumbView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,8,8)];
    newTrackThumbView.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/AloMadeMeDoThis/newTrackThumbImage.png"];
    [self.knobView addSubview:newTrackThumbView];
        
    newTrackThumbView.translatesAutoresizingMaskIntoConstraints = false;
    [newTrackThumbView.bottomAnchor constraintEqualToAnchor:self.knobView.bottomAnchor constant:0].active = YES;
    [newTrackThumbView.leftAnchor constraintEqualToAnchor:self.knobView.leftAnchor constant:0].active = YES;
    [newTrackThumbView.rightAnchor constraintEqualToAnchor:self.knobView.rightAnchor constant:0].active = YES;
    [newTrackThumbView.topAnchor constraintEqualToAnchor:self.knobView.topAnchor constant:0].active = YES;
    }
    return o;
}

- (void)updateVisualStyling {
    %orig;
    self.knobView.backgroundColor = [UIColor clearColor];
    self.knobView.layer.shadowColor = [UIColor clearColor].CGColor;
    self.knobView.layer.shadowOpacity = 0;
}
%end
