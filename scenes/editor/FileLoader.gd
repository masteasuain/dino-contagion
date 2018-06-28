extends Node

const SEPARATOR=","

var file_path
var file 
var levelName="noname"
var matrixData=[]

func _ready():
	file_path = 'res://Maps/level.dino' 
	parseFile()

func parseFile():
	file_path = 'res://Maps/level.dino' 
	file = File.new()
	file.open(file_path,File.READ)
	levelName=readLevelName()
	matrixData=readLevel()
	
func readLevelName():
	var linea=file.get_line() #sets the file read cursor to the next line
	linea=linea.substr(0,linea.find(SEPARATOR))
	return linea

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