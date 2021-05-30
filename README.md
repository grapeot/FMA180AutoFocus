## 锐星FMA180自动对焦解决方案

[[English version]](#english)

最近买了一个锐星的FMA180打算拍广域。这个镜子因为口径特别小（40mm f/4.5，焦距180mm），所以没有配一般的对焦器，而是像镜头一样在镜身上有个对焦环。因为用的ZWO EAF默认只支持望远镜对焦器，所以买了传动皮带做了一个自动对焦的装置。分享一下。

其实思路非常简单，就是3D打印一个鸠尾板，然后打印一个装置把EAF用螺丝固定在鸠尾板上。然后用皮带把望远镜（或者其他镜头）的对焦环和EAF连接起来即可。设计出来的模型可以在github下载：https://github.com/grapeot/FMA180AutoFocus/ 。模型如下图：

![Rendered model](imgs/FMA180_3D1.png)

![Rendered model](imgs/FMA180_3D2.png)

有几个需要注意的地方：

1. 皮带用的就是GT2皮带，3D打印机上很多也是这种。配套的滑轮（不确定是不是应该叫滑轮？pulley）是5mm的。皮带长度我用的是280mm，这样配套FMA180和鸠尾板的长度正好适配。如果用了其他镜头或者皮带需要重新调整参数。
2. 因为对焦环是凸出来的，所以如果直接安装的话会卡死鸠尾板，导致皮带装不进去。所以我们还需要在上面放四个垫圈。垫圈也是可以打印的，见washer.stl。另外两个STL文件一个是鸠尾板一个是EAF支架。我用的是OpenSCAD开发的，源文件也放进去了。
3. 装配非常简单。基本上把螺丝拧上就好了。固定望远镜用的是随镜附赠的M4螺丝，注意拧的时候要套上垫圈。固定EAF用的是EAF带的M4螺丝（螺距和FMA的M4还不一样）。把EAF支架固定在鸠尾板上用的是M6螺丝，需要另外购买。建议的装配顺序是，先装EAF支架，不要拧死螺丝。然后装FMA主镜，也不要拧死螺丝。然后安装皮带，调整FMA和EAF的位置，左右调EAF，前后调FMA，使得对焦环和EAF平齐，皮带有一定张力。拧紧螺丝。注意EAF支架的螺丝不要太紧，否则可能会破坏打印出来的螺纹。
4. 这个对焦环有个坑是对焦的时候自己会前后跑。所以我的设计是有缺陷的。好在EAF自动对焦的行程不长，只要事先大致拧到合焦的位置（刻度大约是10附近），然后调整FMA的前后位置即可。实测这样是可以可靠自动对焦的。

最终的成品类似这样：

![Final result](imgs/FMA180_gear1.jpg)

![Final result](imgs/FMA180_gear2.jpg)

开光拍了个Ha通道2x4的马赛克，总共3小时曝光，效果如图：

![Result image](imgs/FMA180_result.jpg)

<a name="english" id="english"></a>

## Auto focus solution for SharpStar FMA180

Bought a SharpStar FMA180 recently for wide field use.
Probably because of the small aperture (40mm f/4.5, 180mm focal length), it doesn't come with a regular focuser, but has a focus ring just like regular lens.
But the ZWO EAF I use only supports telescope-style focusers.
So I use a belt to make the EAF work with the FMA180.

The idea is simple.
Just print a dovetail to hold both the scope and a EAF rack, which is then fixed to the dovetail using screws.
The focus ring of the scope (or any lens) can be connected to the EAF via a belt.
The 3d models and instructions can be downloaded on github: https://github.com/grapeot/FMA180AutoFocus/ .
The rendered models look like this:

![Rendered model](imgs/FMA180_3D1.png)

![Rendered model](imgs/FMA180_3D2.png)

Several points worth noting:

1. The belt is regular GT2 belt, which can often be found on 3D printers. The The pulley has a bore of 5mm. I use a 280mm length belt, so it fits the FMA180 and the dovetail. When using a belt with a different length or a different scope, you need to adjust the parameters of the dovetail model.
2. Because the focus ring is a bit taller than the scope body, the belt cannot be installed if we directly screw the scope to the dovetail. In this case, four washers are needed between the dovetail and the scope. They are also printable -- check washer.stl. The other two STL files are for the dovetail and the EAF rack. I used OpenSCAD to develop, so I also put the .scad files in the repo.
3. Assembly is easy -- just using screws. To fix the scope to the dovetail, M4 screws with the scope are used. Don't forget to put the washers beforehand. To fix the EAF to the rack, the M4 screws coming with the EAF can be used. Interestingly these two M4 screws have different pitches. To fix the EAF rack to the dovetail, M6 screws are used. Note they need to be bought separately. The suggested assembly order is, first install the EAF rack but leave the screws loose. Then install the FMA scope. Leave the screws loose as well. Then install the belt. Adjust the positions of the FMA and the EAF, such that the EAF pulley and FMA focus ring are aligned, and the belt has enough tension. Then tighten the screws. Pay attention to the screws connecting the EAF rack and the dovetail. Don't over-tighten them. The threads are 3D printed on plastic anyway.
4. One caveat of FMA180 is the focus ring actually moves when focusing. My design doesn't accommodate this. So in order for the auto focus to work properly, before installing the FMA180, you need to roughly focus the scope. I find 10mm on the focus ring gives me good results. In this case, given the auto focus process has pretty limited movement, it can be performed reliably.

The final result looks like this:

![Final result](imgs/FMA180_gear1.jpg)

![Final result](imgs/FMA180_gear2.jpg)

And here is a result of 3 hours' Ha channel, from a 2x4 mosaic:

![Result image](imgs/FMA180_result.jpg)