# scripts FileLoader.gd
extends Node

const SEPARATOR=","

var file_path
var file 
var levelName="noname"
var matrixData=[]
var column =1
var row =1
var dinor =0
var dinol =0
var dinou =0
var dinod =0
func _ready():
	print ("ready func")
	print (global.level_selected)
	file_path = 'res://Maps/'+str(global.level_selected)+'.dino' 
	parseFile()

func parseFile():
	file_path = 'res://Maps/'+str(global.level_selected)+'.dino' 
	file = File.new()
	file.open(file_path,File.READ)
	levelName=readLevelName()
	matrixData=readLevel()
	
func readLevelName():
	var linea=file.get_line() #sets the file read cursor to the next line
	linea =linea.split(",")
	column=linea[1]
	row=linea[2]
	dinor=linea[3]
	dinol=linea[4]
	dinou=linea[5]
	dinod=linea[6]
	return linea[0]

func readLevel():
	var levelData=PoolStringArray([]);
	while(!file.eof_reached ( )):
		var linea=file.get_line() #sets the file read cursor to the next line
		linea=linea.split(SEPARATOR)
		levelData+=linea
	return levelData

func parseMock():
	print(levelName)
	return matrixData
	
func getLevelMatrix():
	return matrixData
	
func getLevelName():
	return levelName

func getLevelColumn():
	return column
	
func getLevelRow():
	return row
	
func getLevelDinor():
	return dinor
	
func getLevelDinol():
	return dinol
	
func getLevelDinou():
	return dinou
	
func getLevelDinod():
	return dinod